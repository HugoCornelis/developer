"""!

An interactive shell for use with the developer python package.

"""
import cmd
import os
import pdb
import re
import shlex # for more complex string splitting
import sys


class SSPyShell(cmd.Cmd):
    """!

    
    """

    def __init__(self, developer=None,
                 intro='Welcome to the Neurospaces Developer shell. Type help or ? to list commands.\n',
                 prompt='ns-dev> ',
                 verbose=True):
        """

        @param developer The developer object to wrap around
        @param intro The intro text to use when starting the shell
        @param prompt The text for the command line prompt.
        """

        cmd.Cmd.__init__(self)

        # This is just an import test of readline to warn the user
        # so they know that autocompletion will not work if this is not
        # found
        try:

            import readline

        except ImportError:

            print "The readline module for python is not installed, autocompletion will not work."

        self.verbose = verbose

        self.intro = intro
        self.prompt = prompt

        self.histfile = None

        # some internal cached lists for auto completion
        self._package_list = []


#---------------------------------------------------------------------------

    def _get_completions(self, token, text='', items=[]):

        if token == '':

            return []
        
        offs = len(token) - len(text)

        completions = [ f[offs:] for f in items
                        if f.startswith(token)

                        ]

        return completions

#---------------------------------------------------------------------------

#---------------------------------------------------------------------------
#----                           Commands                              ------
#---------------------------------------------------------------------------

    def do_EOF(self, arg):
        return True

    def help_EOF(self, arg):

        print "Terminates the shell"
        
    def help_help(self):
        
        self.do_help()



    
#---------------------------------------------------------------------------
# hello (template)

    def do_hello(self, arg):
        print "hello again", arg, "!"

    # using these as templates
    def help_hello(self):
        print "usage: hello [message]",
        print "-- prints a hello message"

    def complete_hello(self, text, line, start_index, end_index):

        tokens = line.split()

        if len(tokens) == 1:

            completions = ['option_1', 'option_2', 'option_3']
            
        elif len(tokens) == 2:
        # Here we autocomplete an element
        
            completions = self._get_completions(tokens[1], text, self._element_list)

        else:

            return []

        return completions

#---------------------------------------------------------------------------
# clear

    def do_clear(self, arg):

        if arg != "":

            self.help_clear()
            
        os.system('clear')
        
    def help_clear(self):
        print "usage: clear",
        print "-- clears the screen"

#---------------------------------------------------------------------------
# continue

    do_continue = do_EOF

    def help_continue(self):
        print "usage: continue",
        print "-- exits the shell and continues the developer"

    do_c = do_continue

    def help_c(self):
        print "usage: c",
        print "-- exits the shell and continues the developer"

    
#---------------------------------------------------------------------------
# pwd

    def do_pwd(self, arg):
        
        if arg:

            self.help_pwd()

        print os.getcwd()

    # using these as templates
    def help_pwd(self):
        print "usage: pwd",
        print "-- print the current directory"


#---------------------------------------------------------------------------
# cd

    def do_cd(self, arg):

        try:

            os.chdir(arg)
            
        except Exception, e:

            print e

            return

    # using these as templates
    def help_cd(self):
        print "usage: cd [directory]",
        print "-- Change the current working directory"

        
#---------------------------------------------------------------------------
# version

    def do_version(self, arg):
        
        version = self._scheduler.Version()

        print "%s" % version
        
    def help_version(self):
        print "usage: version",
        print "-- prints the version"

#---------------------------------------------------------------------------
# quit
    def do_quit(self, arg):
        
        self._scheduler = None

        sys.exit(1)


    def help_quit(self):
        print "usage: quit",
        print "-- terminates the shell and sspy"

#---------------------------------------------------------------------------
# shell
    def do_shell(self, arg):
        """Run a shell command"""
        print "running shell command:", arg
        output = os.popen(arg).read()
        print output
        
    def help_shell(self):
        print "usage: shell [command]",
        print "-- Executes a shell command"


#---------------------------------------------------------------------------
#----                           End Commands                          ------
#---------------------------------------------------------------------------


#---------------------------------------------------------------------------
#----                           Shortcuts                               ----
#---------------------------------------------------------------------------

    do_q = do_quit
    help_q = help_quit
    
