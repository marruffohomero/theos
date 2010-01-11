package Subclass;
use Logos::Group;
@ISA = "Group";

sub new {
	my $proto = shift;
	my $class = ref($proto) || $proto;
	my $self = $class->SUPER::new();
	$self->{CLASS} = undef;
	$self->{SUPERCLASS} = undef;
	$self->{EXPLICIT} = 0;
	bless($self, $class);
	return $self;
}

##################### #
# Setters and Getters #
# #####################
sub class {
	my $self = shift;
	if(@_) { $self->{CLASS} = shift; }
	return $self->{CLASS};
}

sub superclass {
	my $self = shift;
	if(@_) { $self->{SUPERCLASS} = shift; }
	return $self->{SUPERCLASS};
}
##### #
# END #
# #####

sub initializers {
	my $self = shift;
	my $return = "";
	$self->initialized(1);
	$return .= "{";
	foreach(@{$self->{METHODS}}) {
		$return .= $_->buildHookCall;
	}
	$return .= "}";
	return $return;
}

1;