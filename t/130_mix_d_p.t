# Test for a mix between both default and positioned arguments

use Test;
use Getopt::GetArgs;

plan tests => 8;

# Test if init works
ok init();   #1
ok $X, 0;    #2
ok $Y, 0;    #3
ok $Z, 0;    #4

# Test for partial defaults and partial positioned
ok sub1(15, 5);  #5
ok $X,15;    #6
ok $Y,5;     #7
ok $Z,30;    #8


sub init {
  $X = $Y = $Z = 0;
  return 1;
}

sub sub1 {
  my @DEFAULT_ARGS
    =(Parm1 => 10,
      Parm2 => 20,
      Parm3 => 30,
      );
  my %ARGS=GetArgs(@_,@DEFAULT_ARGS);
  ($X, $Y) = @ARGS{"Parm1", "Parm2"};
  ($Z)     = $ARGS{Parm3};
  return 1;
}
