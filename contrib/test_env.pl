#!/usr/bin/perl


use strict;


BEGIN
{
    push @INC, '/usr/local/glue/swig/perl';
}

print "Checking modules\n";

eval
{
  require Heccer;
  Heccer->import();
};

unless($@)
{
  print "Heccer module is present!\n";
}
else
{
  print "Heccer module is not installed: ";
  print $@;
  print "\n";
}



print "-------------------------\n";


eval
{
  require SwiggableHeccer;
  SwiggableHeccer->import();
};

unless($@)
{
  print "SwiggableHeccer module is present!\n";
}
else
{
  print "SwiggableHeccer module is not installed: ";
  print $@;
  print "\n";
}


print "-------------------------\n";

eval
{
  require Neurospaces;
  Neurospaces->import();
};

unless($@)
{
  print "Neurospaces module is present!\n";
}
else
{
  print "Neurospaces module is not installed: ";
  print $@;
  print "\n";
}

print "-------------------------\n";

eval
{
  require SwiggableNeurospaces;
  SwiggableNeurospaces->import();
};

unless($@)
{
  print "SwiggableNeurospaces module is present!\n";
}
else
{
  print "SwiggableNeurospaces module is not installed: ";
  print $@;
  print "\n";
}

print "-------------------------\n";

eval
{
  require Experiment;
  Experiment->import();
};

unless($@)
{
  print "Experiment module is present!\n";
}
else
{
  print "Experiment module is not installed: ";
  print $@;
  print "\n";
}

print "-------------------------\n";

eval
{
  require SwiggableExperiment;
  SwiggableExperiment->import();
};

unless($@)
{
  print "SwiggableExperiment module is present!\n";
}
else
{
  print "SwiggableExperiment module is not installed: ";
  print $@;
  print "\n";
}
