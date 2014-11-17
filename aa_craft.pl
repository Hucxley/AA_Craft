#!D:\Applications\Strawberry\perl\bin\perl.exe

use strict;
use warnings;

use constant RECURSION_LIMIT    => 15;

my $rec_ctr = 0;

my %craft =  (
"apprentice's typhoon cap"      => { "moonlight archeum dust" => 2, "leather" => 3, "blue salt wedge" => 3 },
#"archeum ingot"                 => { "archeum ore" => 3 },
"artificer's typhoon cap"       => { "craftsman's typhoon cap" => 1, "moonlight archeum shard" => 2, "leather" => 9, "blue salt wedge" => 7, "small seed oil" => 1 },
"artisan's typhoon cap"         => { "artificer's typhoon cap" => 1, "moonlight archeum shard" => 3, "leather" => 12, "blue salt gloves" => 2, "small seed oil" => 1 },
"cart bucket"                   => { "copper ingot" => 2, "leather" => 2 },
"conqueror's typhoon cap"       => { "artisan's typhoon cap" => 1, "moonlight archeum crystal" => 2, "leather" => 15, "blue salt gloves" => 4, "viscous glossy oil" => 1 },
#"copper ingot"                  => { "copper ore" => 3 },
"craftsman's typhoon cap"       => { "apprentice's typhoon cap" => 1, "moonlight archeum dust" => 3, "leather" => 6, "blue salt wedge" => 5 },
"deeply colored oil"            => { "dragon essence stabilizer" => 3, "quinoa" => 50, "cultivated ginseng" => 50, "sparkling shell dust" => 10, "coconut" => 10 },
"delphinad typhoon cap"         => { "sealed delphinad cap" => 1 },
"emulsified oil"                => { "crystal stabilizer" => 3, "bean" => 40, "rye" => 40, "pearl" => 20, "vanilla" => 5 },
"epherium typhoon cap"          => { "sealed epherium cap" => 1 },
"exquisite diaphragm"           => { "gold ingot" => 5, "amethyst" => 3, "diamond" => 2, "viscous glossy oil" => 1 },
#"fabric"                        => { "cotton/wool" => 10 },
"fabric pack"                   => { "fabric" => 100 },
"farm wagon"                    => { "farm wagon design" => 1, "strong wheel" => 4, "solid shaft" => 1, "high power engine" => 1, "cart bucket" => 1, "scroll: farm cart" => 1 },
"fine leather"                  => { "leather" => 10, "small seed oil" => 1 },
"fine lumber"                   => { "lumber" => 10, "small seed oil" => 1 },
"fish crane"                    => { "fine lumber" => 5, "mechanical spring" => 1 },
"fish finder"                   => { "starshard ingot" => 5, "exquisite diaphragm" => 1 },
"fish-find longliner"           => { "fish-find longliner design" => 1, "fishing license" => 1, "fish finder" => 1, "fish crane" => 1, "solid shaft" => 1, "lumber pack" => 2, "fabric pack" => 2, "iron pack" => 2 },
"fragrant soup"                 => { "sweet soup" => 1, "ground grain" => 3, "rosemary" => 3 },
"gilda dust"                    => { "gilda star" => 0.25 },
#"gold ingot"                    => { "gold ore" => 3 },
"hearty soup"                   => { "fragrant soup" => 1, "ground grain" => 3, "jujube" => 1 },
"high power engine"             => { "flaming log" => 5, "silver ingot" => 10, "gold ingot" => 10, "archeum ingot" => 1 },
"illustrious typhoon cap"       => { "sealed illustrious cap" => 1 },
#"iron ingot"                    => { "iron ore" => 3 },
"iron pack"                     => { "iron ingot" => 100 },
"lumber pack"                   => { "lumber" => 100 },
#"lumber"                        => { "log" => 3 },
"magnificent typhoon cap"       => { "sealed magnificent cap" => 1 },
"mechanical spring"             => { "iron ingot" => 20, "copper ingot" => 5, "archeum ingot" => 3, "rough polish" => 1 },
"non-stick polish"              => { "crystal stabilizer" => 3, "chili pepper" => 40, "rosemary" => 40, "pearl" => 20, "blueberry" => 5 },
"opaque polish"                 => { "charcoal stabilizer" => 3, "azalea" => 20, "narcissus" => 20 },
"rainbow polish"                => { "dragon essence stabilizer" => 3, "turmeric" => 50, "aloe" => 50, "sparkling shell dust" => 10, "beechnut" => 10 },
"rough polish"                  => { "rock salt stabilizer" => 3, "lotus" => 30, "oats" => 30, "antler coral" => 20 },
"savory soup"                   => { "ground grain" => 3 },
"sealed delphinad cap"          => { "epherium typhoon cap" => 1, "moonlight archeum essence" => 4, "wind spirit leather" => 2, "blue salt hammer" => 5, "deeply colored oil" => 1, "gilda dust" => 11 },
"sealed epherium cap"           => { "magnificent typhoon cap" => 1, "moonlight archeum essence" => 3, "fine leather" => 6, "blue salt hammer" => 3, "emulsified oil" => 1, "gilda dust" => 7 },
"sealed illustrious cap"        => { "conqueror's typhoon cap" => 1, "moonlight archeum crystal" => 3, "fine leather" => 4, "blue salt gloves" => 6, "viscous glossy oil" => 1, "gilda dust" => 2 },
"sealed magnificent cap"        => { "illustrious typhoon cap" => 1, "moonlight archeum essence" => 2, "fine leather" => 5, "blue salt gloves" => 8, "emulsified oil" => 1, "gilda dust" => 4 },
#"silver ingot"                  => { "silver ore" => 3 },
"small seed oil"                => { "charcoal stabilizer" => 3, "rice" => 20, "corn" => 20 },
"solid shaft"                   => { "thunderstruck tree" => 2, "sunridge ingot" => 1 },
#"starshard ingot"               => { "sharshard chip" => 3 },
#"stone brick"                   => { "raw stone" => 3 },
"strong wheel"                  => { "archeum log" => 2, "sturdy ingot" => 0.5 },
"sturdy ingot"                  => { "iron ingot" => 8, "copper ingot" => 1, "silver ingot" => 1, "opaque polish" => 1 },
"sunridge ingot"                => { "sturdy ingot" => 10, "mysterious garden powder" => 5, "rough polish" => 1 },
"sweet soup"                    => { "vegetable soup" => 1, "ground grain" => 3, "pumpkin" => 5 },
"vegetable soup"                => { "whole grain soup" => 1, "ground grain" => 3, "tomato" => 1 },
"viscous glossy oil"            => { "rock salt stabilizer" => 3, "peanut" => 30, "wheat" => 30, "red coral" => 20 },
"wind spirit leather"           => { "fine leather" => 10, "mysterious garden powder" => 5, "viscous glossy oil" => 1 },
"whole grain soup"              => { "savory soup"  => 1, "ground grain" => 3, "barley" => 2 },
"ynystere bouquets"             => { "ground grain" => 50, "rose" => 200 },
"ynystere olive oil"            => { "ground spices" => 50, "olive" => 14 },
"ynystere preserves"            => { "chopped produce" => 50, "orange" => 8 }
);

sub add_to_list {
    $rec_ctr++;
    if ($rec_ctr >= RECURSION_LIMIT) { return; }
    my $item = shift;
    my $qty = shift;
    my $ref = shift;
    
    if ($craft{$item}) {
        foreach my $key (keys %{$craft{$item}}) {
            my $val = $craft{$item}{$key};
            $val *= $qty;
            add_to_list($key, $val, $ref);
        }
    } else {
        if (not defined $ref->{$item}) { $ref->{$item} = 0; }
        $ref->{$item} += $qty;
    }
    
    $rec_ctr--;
    
    return;
}

my $again = "";

do {
    my $input = "";
    print "\nPlease enter an item name: ";
    $input = <STDIN>;
    chomp($input);
    $input = lc($input);
    my $qty;
    
    if($input =~ /^(\d+)x/) {
        $qty = $1;
        $input =~ s/^\d+x\s*//;
    } else {
        $qty = 1;
    }

#    print "You entered: $input\n";
#    print "Quantity: $qty\n";

    if (not %craft) {
        print "\%craft is undefined.\n";
    } else {
        if (defined $craft{$input}) {
            my %list;
            add_to_list($input, $qty, \%list);

            print "Materials required:\n\n";
            
            my @keys = sort { $list{$a} <=> $list{$b} || $a cmp $b } keys(%list);
            my @vals = @list{@keys};

            foreach my $key (@keys) {
                my $str = $key;
                $str =~ s/\b([\w']+)\b/\u$1/g;
                printf ("%sx\t%s\n", $list{$key}, $str);
            }
        } else {
            print "Not found in database.\n\n";
        }
    }
    
    print "\nLook up another? [y/n]: ";
    $again = <STDIN>;
    chomp($again);
    $again = lc($again);
} while ($again !~ /^n$/i);

