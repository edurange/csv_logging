# No arguments needed, will get them from machine
#$fh=new IO::File("/var/emulab/boot/nickname");
#while(<$fh>)
#{
#	$line = $_;
#	$line =~ s/\R//g;
#   @items = split /\./, $line;
#   $host=$items[0];
#   $exp=$items[1];
#   $proj=$items[2];
#}
#print "$host $exp $proj\n";
#$fn = "/proj/" . $proj . "/exp/" . $exp . "/logs/cli." . $host . ".csv";
#$time=time;
#if (-e $fn)
#{
#    system("mv $fn $fn.$time");
#}

#$host = system("$(hostname)")

while(1)
{
    system("cat /var/log/ttylog/ttylog.* > /var/log/ttylog/alltty.\$\(hostname\).\$\(whoami\)");
    system("python3 /usr/local/src/analyze.py /var/log/ttylog/alltty.\$\(hostname\).\$\(whoami\)" . " /var/log/ttylog/cli.\$\(hostname\).\$\(whoami\).csv");
    sleep(60);
}
