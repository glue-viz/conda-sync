# Script to sync conda packages from one channel to another

from __future__ import print_function

import os
import sys

from argparse import ArgumentParser

from binstar_client import NotFound, Conflict
from binstar_client.utils import get_server_api


def sync(from_channel, to_channel, package, token, exact_version=None,
         from_label='main', to_label='main'):
    """
    Sync all versions of a package from a conda channel to another conda
    channel.
    """

    print("Syncing {0} from {1} to {2}".format(package, from_channel, to_channel))

    # Get an API object to interact with anaconda.org
    api = get_server_api(token=token)

    # Find out which versions are available from origin
    package_orig = api.package(from_channel, package)
    versions_orig = [(x['version'], x['basename']) for x in package_orig['files'] if from_label in x['labels']]

    # Find out which versions are available from destination
    try:
        package_dest = api.package(to_channel, package)
        versions_dest = [(x['version'], x['basename']) for x in package_dest['files'] if to_label in x['labels']]
    except NotFound:
        versions_dest = []

    # Find which ones need to be synced
    versions_sync = set(versions_orig) - set(versions_dest)

    # Copy over
    for version, basename in versions_sync:
        if exact_version is not None and version != exact_version:
            continue
        print(' -> copying {0} from {1} [{2}] to {3} [{4}]...'.format(basename, from_channel, from_label, to_channel, to_label))
        try:
            api.copy(from_channel, package, version, basename=basename,
                     to_owner=to_channel, from_label=from_label, to_label=to_label)
        except Conflict:
            # Really this should never happen, but it does.
            print('    *** Copy failed because of conflict on destination ***')


def main(*argv):

    parser = ArgumentParser('Sync packages from one conda owner to another')
    parser.add_argument('--package', help='Package to sync')
    parser.add_argument('--source', help='Source conda channel owner')
    parser.add_argument('--source-label', help='Label of the package in the source channel', default='main')
    parser.add_argument('--version', help='Specific version to sync (optional)', default=None)
    parser.add_argument('--destination', help='Destination conda channel owner')
    parser.add_argument('--destination-label', help='Label of the package in the destination channel', default='main')
    parser.add_argument('--token', default=None,
                        help=('anaconda.org API token. May set '
                              'environmental variable BINSTAR_TOKEN '
                              'instead.'))

    args = parser.parse_args()

    token = args.token or os.getenv('BINSTAR_TOKEN')

    sync(args.source, args.destination, args.package, token, exact_version=args.version,
         from_label=args.source_label, to_label=args.destination_label)

if __name__ == "__main__":
    main(*sys.argv)
