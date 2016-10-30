#!/usr/bin/python

import os
import sys
import argparse
import subprocess
import fnmatch

__author__ = "Martin Kiesel"
__copyright__ = "Copyright 2016, FEIstyle v1.3"
__license__ = "MIT"
__version__ = "0.0.3"
__maintainer__ = "Martin Kiesel"
__email__ = "martin.kiesel@gmail.com"
__status__ = "Development"


def git_available():
    """
    check if git is available
    :raises OSError:
    """
    null = open("/dev/null", "w")
    subprocess.Popen("git", stdout=null, stderr=null)
    null.close()


def git_ignore():
    """
    uses following command:
        $ git ls-files --others --ignored --exclude-standard --directory
    to read ignored files in current git repository
    :return git_ignores: (list) of ignored directories
    """
    git_ignores = ['*/.*', '*/' + os.path.basename(__file__)]

    try:
        git_available()
        git = subprocess.Popen(['git', 'ls-files', '--others', '--ignored', '--exclude-standard', '--directory'],
                               stdout=subprocess.PIPE,
                               stderr=subprocess.PIPE,
                               cwd=None)
    except (subprocess.CalledProcessError, OSError):
        return git_ignores

    for line in git.stdout:
        git_ignores.append('*/' + line.decode('utf-8').rstrip().rstrip('/'))
    return git_ignores


def walk(path='.', depth=None, respect_git_ignore=True):
    """
    recursively walk directory to specified depth
    :param path: (str) the base path to start walking from
    :param depth: (None or int) max. recursive depth, None = no limit
    :param respect_git_ignore: (bool) respect git ignore(s) (exclude files/folders as .gitignore does)
    :yields: (str) filename, including path
    """
    ignore_list = git_ignore() if respect_git_ignore else []

    if depth and depth == 1:
        for file_name in os.listdir(path):
            if any(fnmatch.fnmatch('/' + file_name, pattern) for pattern in ignore_list):
                continue
            yield file_name
    else:
        top_path_len = len(path) + len(os.path.sep)
        for dir_path, dir_names, file_names in os.walk(path):
            for dir_name in reversed(dir_names):
                if any(fnmatch.fnmatch(os.path.join(dir_path, dir_name), pattern) for pattern in ignore_list):
                    dir_names.remove(dir_name)
            dir_level = dir_path[top_path_len:].count(os.path.sep)
            if depth and dir_level >= depth:
                dir_names[:] = []
            else:
                for file_name in file_names:
                    if any(fnmatch.fnmatch(os.path.join(dir_path, file_name), pattern) for pattern in ignore_list):
                        continue
                    yield os.path.join(dir_path, file_name)


def rewrite_to_latex(path):
    """
    rewrites to latex:
        if path is directory, wrap path in \textbf{}
        append \\ in the end of path (LaTeX - \n)
        replace '_' with '\_'
    :param path:
    :return:
    """
    if os.path.isdir('.' + path):
        path = '\\textbf{' + path + '}'
    path = path.replace('_', '\\_') + ' \\\\'
    return path


def paths(file_name, render_paths):
    """
    form list of all paths including directories eg:
    file_name = './application/test/MyTest.c'
    render_paths = ['/application', '/application/test', '/application/test/MyTest.c']
    :param file_name:
    :param render_paths:
    :return: returns render_paths "by reference" - list is mutable
    """
    root = ''
    file_name = file_name.lstrip('./')
    for directory in list(filter(lambda x: x != '', os.path.dirname(file_name).split('/'))):
        root = root + '/' + directory
        if root not in render_paths:
            render_paths.append(root)
    render_paths.append('/' + file_name)


def write_to_file(render_paths, file):
    """
    writes to file
    :param render_paths:
    :param file:
    :return:
    """
    f = open(file, 'w')
    for path in render_paths:
        f.write(path + '\n')


def main():
    parser = argparse.ArgumentParser(description='Generate contents of electronic medium for FEIstyle template.')
    parser.add_argument('-d', '--depth', dest='depth', type=int, default=3, help='directory scan depth')
    parser.add_argument('-r', '--root', dest='root', type=str, default='.', help='root of electronic medium (relative or absolute path)')
    parser.add_argument('-o', '--outfile', dest='file_out', type=str, default='./attachmentA.tex',
                        help='file destination')
    parser.add_argument('-q', '--quiet', dest='quiet_flag', action='store_true', help='no output is displayed')
    parser.add_argument('-s', '--skip-parent', dest='skip_parend_flag', action='store_true',
                        help='"/" directory is skipped')
    parser.add_argument('-i', '--ignore-gitignore', dest='ignore_list_flag', action='store_false', help='ignore .gtignore (do NOT respect .gitignore)')
    parser.add_argument('-dr', '--dry-run', dest='dry_run_flag', action='store_true',
                        help='dry run, does not write to file')
    args = parser.parse_args()

    if args.quiet_flag:
        devnull = open(os.devnull, 'w')
        sys.stdout = devnull
        sys.stderr = devnull

    original_cwd = os.getcwd()

    root = args.root
    if os.path.isabs(root):
        os.chdir(root)
    else:
        os.chdir(os.path.abspath(os.getcwd() + '/' + args.root))
    root = '.'

    render_paths = ['/'] if not args.skip_parend_flag else []

    for file_name in walk(root, args.depth, args.ignore_list_flag):
        paths(file_name, render_paths)

    render_paths = list(map(rewrite_to_latex, render_paths))
    render_paths[-1] = render_paths[-1].rstrip('\\')

    os.chdir(original_cwd)

    if not args.dry_run_flag:
        write_to_file(render_paths, args.file_out)

    for path in render_paths:
        print(path)


if __name__ == "__main__":
    main()
