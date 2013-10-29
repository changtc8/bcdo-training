#!/usr/bin/env python
"""print each command line options and its value
   valid parameter value against AWS
   create node
"""
import argparse
import sys
import os
from libcloud.compute.types import Provider
from libcloud.compute.providers import get_driver


class Ec2(object):
    """Main class to parse ec2run
    """
    def __init__(self, argv=None):
        """Initializer

        Keyword Arguments:
        argv - list of arguments
        """
        if argv is None:
            self.args = []
        else:
            self.args = self.parse_args(argv)

    def parse_args(self, argv):
        """parse the argv, build the parser and save args """

        parser = argparse.ArgumentParser(prog='ec2')
        """mutual exclude option for -d or -f """
        group = parser.add_mutually_exclusive_group()
        i = 1
        while i < len(argv):
            """print " self._argv{} = {}".format(i,self._argv[i])"""
            if argv[i] == '-r':
                parser.add_argument("-r", "--region",
                                    help="ec2 region", action='store')
            elif argv[i] == '-z':
                parser.add_argument("-z", "--availability-zone",
                                    help="ec2 availability zone",
                                    action='store')
            elif argv[i] == '-a':
                parser.add_argument("-a", "--AMI",
                                    help="AMI name", action='store')
            elif argv[i] == '-d':
                group.add_argument("-d", "--user_data",
                                   help="user data string", action='store')
            elif argv[i] == '-f':
                group.add_argument("-f", "--user_data_file",
                                   help="Read user data from file",
                                   action='store')
            elif argv[i] == '-g':
                parser.add_argument("-g", "--group",
                                    help="Ec2 Security group name or id",
                                    action='append')
            elif argv[i] == '-k':
                parser.add_argument("-k", "--key",
                                    help="Ec2 keypari name",
                                    action='store')
            elif argv[i] == '-t':
                parser.add_argument("-t", "--instance-type",
                                    help="Ec2 Instance Type",
                                    action='store')
            elif argv[i] == '-n':
                parser.add_argument("-n", "--instance-count",
                                    help="Maximum instance to launch",
                                    action='store', type=int)
            else:
                print "invalid option"
            i = i + 2
        return parser.parse_args()

    def print_args(self):
        """print the arg name and value """
        for var in vars(self.args):
            print "{}: {}".format(var, self.args.__getattribute__(var))

    def setup_conn(self):
        """ setup connection to the cloude provider """
        regiondict = {'us-east-1': Provider.EC2_US_EAST,
                      'us-west-1': Provider.EC2_US_WEST,
                      'eu_west-1': Provider.EC2_EU_WEST,
                      'ap_southeast-1': Provider.EC2_AP_SOUTHEAST,
                      'ap_northeast-1': Provider.EC2_AP_NORTHEAST,
                      'us-west-2': Provider.EC2_US_WEST_OREGON,
                      'sa_east-1': Provider.EC2_SA_EAST}

        print " key {} value {}".format(self.args.region,
                                        regiondict[self.args.region])
        driver = get_driver(regiondict[self.args.region])
        AWS_ACCESS_KEY = os.environ.get('AWS_ACCESS_KEY', None)
        AWS_SECRET_KEY = os.environ.get('AWS_SECRET_KEY', None)
        assert AWS_ACCESS_KEY is not None
        assert AWS_SECRET_KEY is not None
        return driver(AWS_ACCESS_KEY, AWS_SECRET_KEY)

    def validate_create(self):
        """  validate command option parameter value """
        conn = self.setup_conn()
        print " conn {}".format(conn)

        print " avail-zone = {}".format(self.args.availability_zone)
        avail_zone_list = conn.ex_list_availability_zones()
        found = False
        for zone in avail_zone_list:
            """print " zone name {}".format(zone.name)"""
            if zone.name == self.args.availability_zone:
                """conn.location = zone"""
                found = True
                break
        if (not found):
            print " invalid available zone {} for {}".format(
                self.args.availability_zone, self.args.region)
        else:
            print " valid available zone {} for {}".format(
                self.args.availability_zone, self.args.region)

        print " image={}".format(self.args.AMI)
        image_list = conn.list_images(None, [self.args.AMI])
        print " images count {}".format(len(image_list))

        found = False
        for image in image_list:
            print " image id {}".format(image.id)
            if (image.id == self.args.AMI):
                print " image id {}".format(image.id)
                print " conn.image {}".format(image)
                found = True
                break
        if (not found):
            print " invalid image {} for {}".format(self.args.AMI,
                                                    self.args.region)
        else:
            print " valid image {} for {}".format(self.args.AMI,
                                                  self.args.region)

        grp_list = conn.ex_list_security_groups()
        for grp in self.args.group:
            print " group = {}".format(self.args.group)
            found = False
            for group in grp_list:
                """print " group name {}".format(group)"""
                if (grp == group):
                    found = True
                    break
            if (not found):
                print " invalid group {} for {}".format(self.args.group,
                                                        self.args.region)
            else:
                print " valid group {} for {}".format(self.args.group,
                                                      self.args.region)

        print " key pair = {}".format(self.args.key)
        keypair_list = conn.ex_describe_all_keypairs()
        found = False
        for key in keypair_list:
            """print " key pair {}".format(key)"""
            if self.args.key == key:
                found = True
                break
        if (not found):
            print " invalid key pair {} for {}".format(self.args.key,
                                                       self.args.region)
        else:
            print " valid key pair {} for {}".format(self.args.key,
                                                     self.args.region)

        sizes = conn.list_sizes()
        print " sizes count {}".format(len(sizes))
        node = conn.create_node(image=image_list[0], size=sizes[0],
                                location=self.args.region,
                                ex_keyname=self.args.key,
                                ex_securitygroup=self.args.group,
                                name="inst1")
        print node


def main(argv=None):
    """Main function
    """
    ec2 = Ec2(argv)
    ec2.print_args()
    ec2.validate_create()


if __name__ == '__main__':
    main(sys.argv)
