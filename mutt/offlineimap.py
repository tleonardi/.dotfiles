#!/usr/bin/python
# From Steve Losh blog
# http://stevelosh.com/blog/2012/10/the-homely-mutt/#retrieving-passwords
import re, subprocess
def get_keychain_pass(account=None, server=None):
    params = {
        'security': '/usr/bin/security',
        'command': 'find-generic-password',
        'account': account,
        'server': server,
    }
    command = "%(security)s -v %(command)s -g -a %(account)s -s %(server)s " % params
    output = subprocess.check_output(command, shell=True, stderr=subprocess.STDOUT)
    outtext = [l for l in output.splitlines()
               if l.startswith('password: ')][0]

    return re.match(r'password: "(.*)"', outtext).group(1)
