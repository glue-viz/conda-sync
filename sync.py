# Script to sync conda packages from one channel to another

from __future__ import print_function

import os
import sys

from argparse import ArgumentParser

from binstar_client import NotFound
from binstar_client.utils import get_server_api


def sync(from_channel, to_channel, package, token):
    """
    Sync all versions of a package from a conda channel to another conda
    channel.
    """

    print("Syncing {0} from {1} to {2}".format(package, from_channel, to_channel))

    # Get an API object to interact with anaconda.org
    api = get_server_api(token=token)

    # Find out which versions are available from origin
    package_orig = api.package(from_channel, package)
    versions_orig = [(x['version'], x['basename']) for x in package_orig['files']]

    # Find out which versions are available from destination
    try:
        package_dest = api.package(to_channel, package)
        versions_dest = [(x['version'], x['basename']) for x in package_dest['files']]
    except NotFound:
        versions_dest = []

    # Find which ones need to be synced
    versions_sync = set(versions_orig) - set(versions_dest)

    # Copy over
    for version, basename in versions_sync:
        print(' -> copying {0}...'.format(basename))
        api.copy(from_channel, package, version, basename=basename, to_owner=to_channel)


def main(*argv):

    parser = ArgumentParser('Sync packages from one conda owner to another')
    parser.add_argument('--package', help='Package to sync')
    parser.add_argument('--source', help='Source conda channel owner')
    parser.add_argument('--destination', help='Destination conda channel owner')
    parser.add_argument('--token', default=None,
                        help=('anaconda.org API token. May set '
                              'environmental variable BINSTAR_TOKEN '
                              'instead.'))

    args = parser.parse_args()

    token = args.token or os.getenv('BINSTAR_TOKEN')

    sync(args.source, args.destination, args.package, token)

if __name__ == "__main__":
    main(*sys.argv)
