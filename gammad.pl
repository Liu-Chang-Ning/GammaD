my $N = $ARGV[0];
my $M = $ARGV[1];

my $R = GammaD($N, $M);

print "$R\n";

sub GammaD{
	my ($N, $M) = @_;
	if(not($N>0 and $M>0)){return -1;}

	my $Gamma = 0.577216;
	my $Epsilon = 2.71828;
	
	if($N==$M){return 1;}

	my $sig = 1;
	if($N<$M){
		($N, $M, $sig) = ($M, $N, -1);
	}
	
	my $R=1;
	while(($N-$M)>=1){
		$N--;
		$R = $R*$N;
	}
	
	if($N==$M){
		if($sig==1){
			return $R;
		}else{
			return 1/$R;
		}
	}else{
		$R= $R*($M/$N)*($Epsilon**(-1*$Gamma*($N-$M)));
		for(my $k=1; $k<1000000; $k++){
			my $r = (1-(($N-$M)/($k+$N)))*($Epsilon**(($N-$M)/$k));
			$R = $R*$r;
		}
		if($sig==1){
			return $R;
		}else{
			return 1/$R;
		}
	}
}
