#!D:\Applications\Strawberry\perl\bin\perl.exe

use strict;
use warnings;

use constant RECURSION_LIMIT    => 15;

my $rec_ctr = 0;

my %craft =  (
"afternoon sun"                 => { "hushed star" => 1, "medicinal powder" => 0.8, "mushroom" => 1 },
"apprentice's typhoon cap"      => { "moonlight archeum dust" => 2, "leather" => 3, "blue salt wedge" => 3 },
"archeum ingot"                 => { "archeum ore" => 3 },
"arcum iris lavaspice"          => { "quality certificate" => 1, "dried flowers" => 50, "turmeric" => 60 },
"arcum iris roasted eggs"       => { "quality certificate" => 1, "ground spices" => 50, "egg" => 30 },
"arcum iris salt crackers"      => { "quality certificate" => 1, "ground grain" => 50, "sunflower" => 65 },
"artificer's typhoon cap"       => { "craftsman's typhoon cap" => 1, "moonlight archeum shard" => 2, "leather" => 9, "blue salt wedge" => 7, "small seed oil" => 1 },
"artisan's typhoon cap"         => { "artificer's typhoon cap" => 1, "moonlight archeum shard" => 3, "leather" => 12, "blue salt gloves" => 2, "small seed oil" => 1 },
"cart bucket"                   => { "copper ingot" => 2, "leather" => 2 },
"cinderstone medicinal powder"  => { "quality certificate" => 1, "medicinal powder" => 50, "azalea" => 190 },
"cinderstone sacred candles"    => { "quality certificate" => 1, "ground spices" => 50, "bay leaf" => 40 },
"cinderstone tart mead"         => { "quality certificate" => 1, "dried flowers" => 50, "lemon" => 20 },
"conqueror's typhoon cap"       => { "artisan's typhoon cap" => 1, "moonlight archeum crystal" => 2, "leather" => 15, "blue salt gloves" => 4, "viscous glossy oil" => 1 },
"copper ingot"                  => { "copper ore" => 3 },
"craftsman's typhoon cap"       => { "apprentice's typhoon cap" => 1, "moonlight archeum dust" => 3, "leather" => 6, "blue salt wedge" => 5 },
"deeply colored oil"            => { "dragon essence stabilizer" => 3, "quinoa" => 50, "cultivated ginseng" => 50, "sparkling shell dust" => 10, "coconut" => 10 },
"delphinad typhoon cap"         => { "sealed delphinad cap" => 1 },
"desert fire"                   => { "sun's glory" => 1, "medicinal powder" => 0.8, "ginkgo leaf" => 0.1 },
"dewstone distilled liquor"     => { "quality certificate" => 1, "medicinal powder" => 50, "narcissus" => 190 },
"dewstone fine thread"          => { "quality certificate" => 1, "ground grain" => 50, "goat wool" => 30 },
"dewstone toy robots"           => { "quality certificate" => 1, "orchard puree" => 15, "ginkgo leaf" => 10 },
"emulsified oil"                => { "crystal stabilizer" => 3, "bean" => 40, "rye" => 40, "pearl" => 20, "vanilla" => 5 },
"epherium typhoon cap"          => { "sealed epherium cap" => 1 },
"exquisite diaphragm"           => { "gold ingot" => 5, "amethyst" => 3, "diamond" => 2, "viscous glossy oil" => 1 },
"fabric pack"                   => { "fabric" => 100 },
"fabric"                        => { "cotton/wool" => 10 },
"falcorth plains apple tarts"   => { "quality certificate" => 1, "ground grain" => 50, "apple" => 20 },
"falcorth plains fertilizer"    => { "quality certificate" => 1, "dried flowers" => 50, "carrot" => 180 },
"falcorth snowlion yarn"        => { "quality certificate" => 1, "medicinal powder" => 50, "goose down" => 30 },
"farm wagon"                    => { "farm wagon design" => 1, "strong wheel" => 4, "solid shaft" => 1, "high power engine" => 1, "cart bucket" => 1, "scroll: farm cart" => 1 },
"fine leather"                  => { "leather" => 10, "small seed oil" => 1 },
"fine lumber"                   => { "lumber" => 10, "small seed oil" => 1 },
"fish crane"                    => { "fine lumber" => 5, "mechanical spring" => 1 },
"fish finder"                   => { "starshard ingot" => 5, "exquisite diaphragm" => 1 },
"fish-find longliner"           => { "fish-find longliner design" => 1, "fishing license" => 1, "fish finder" => 1, "fish crane" => 1, "solid shaft" => 1, "lumber pack" => 2, "fabric pack" => 2, "iron pack" => 2 },
"fragrant soup"                 => { "sweet soup" => 1, "ground grain" => 3, "rosemary" => 3 },
"gilda dust"                    => { "gilda star" => 0.25 },
"gold ingot"                    => { "gold ore" => 3 },
"gweonid apple pies"            => { "quality certificate" => 1, "chopped produce" => 50, "apple" => 15 },
"gweonid dyed feathers"         => { "quality certificate" => 1, "orchard puree" => 15, "goose down" => 15 },
"gweonid piquant spices"        => { "quality certificate" => 1, "medicinal powder" => 50, "onion" => 190 },
"halcyona livestock feed"       => { "quality certificate" => 1, "chopped produce" => 50, "oats" => 75 },
"halcyona wheat biscuit"        => { "quality certificate" => 1, "ground grain" => 50, "egg" => 35 },
"halcyona yam pasta"            => { "quality certificate" => 1, "dried flowers" => 50, "yam" => 90 },
"hasla cured meat"              => { "quality certificate" => 1, "trimmed meat" => 50, "lily" => 100 },
"hasla softened fabric"         => { "quality certificate" => 1, "medicinal powder" => 50, "duck down" => 30 },
"hasla specialty tea"           => { "quality certificate" => 1, "orchard puree" => 15, "cornflower" => 45 },
"hearty soup"                   => { "fragrant soup" => 1, "ground grain" => 3, "jujube" => 1 },
"hellswamp ground peanuts"      => { "quality certificate" => 1, "ground spices" => 50, "peanut" => 100 },
"hellswamp mushroom pot pies"   => { "quality certificate" => 1, "orchard puree" => 15, "mushroom" => 100 },
"hellswamp spicy meat"          => { "quality certificate" => 1, "trimmed meat" => 50, "banana" => 12 },
"high power engine"             => { "flaming log" => 5, "silver ingot" => 10, "gold ingot" => 10, "archeum ingot" => 1 },
"hushed star"                   => { "veiled flame" => 1, "medicinal powder" => 0.8, "lavender" => 2 },
"illustrious typhoon cap"       => { "sealed illustrious cap" => 1 },
"iron ingot"                    => { "iron ore" => 3 },
"iron pack"                     => { "iron ingot" => 100 },
"lilyut cooking oil"            => { "quality certificate" => 1, "dried flowers" => 50, "olive" => 12 },
"lilyut hills barley moonshine" => { "quality certificate" => 1, "orchard puree" => 15, "barley" => 100 },
"lilyut hills milk soap"        => { "quality certificate" => 1, "ground spices" => 50, "milk" => 20 },
"lumber pack"                   => { "lumber" => 100 },
"lumber"                        => { "log" => 3 },
"mage's vapor"                  => { "medicinal powder" => 1.2 },
"magnificent typhoon cap"       => { "sealed magnificent cap" => 1 },
"mahadevi elephant cookies"     => { "quality certificate" => 1, "chopped produce" => 50, "banana" => 10 },
"mahadevi pickles"              => { "quality certificate" => 1, "ground spices" => 50, "cucumber" => 200 },
"mahadevi root herbs"           => { "quality certificate" => 1, "orchard puree" => 15, "bay leaf" => 20 },
"marianople duck down"          => { "quality certificate" => 1, "dried flowers" => 50, "duck down" => 30 },
"marianople face cream"         => { "quality certificate" => 1, "chopped produce" => 50, "iris" => 160 },
"marianople sweeteners"         => { "quality certificate" => 1, "ground spices" => 50, "cherry" => 8 },
"meadow stream"                 => { "morning dew" => 1, "medicinal powder" => 1.2, "cornflower" => 0.5 },
"mechanical spring"             => { "iron ingot" => 20, "copper ingot" => 5, "archeum ingot" => 3, "rough polish" => 1 },
"midsummer meteor"              => { "afternoon sun" => 1, "medicinal powder" => 0.8, "lotus" => 0.5 },
"misty memory"                  => { "mage's vapor" => 1, "medicinal powder" => 1.2, "iris" => 2 },
"morning dew"                   => { "misty memory" => 1, "medicinal powder" => 1.2, "thistle" => 1 },
"mossy pool"                    => { "time's river" => 1, "medicinal powder" => 1.2, "bay leaf" => 0.1 },
"non-stick polish"              => { "crystal stabilizer" => 3, "chili pepper" => 40, "rosemary" => 40, "pearl" => 20, "blueberry" => 5 },
"opaque polish"                 => { "charcoal stabilizer" => 3, "azalea" => 20, "narcissus" => 20 },
"perinoor aged spices"          => { "quality certificate" => 1, "ground spices" => 50, "avocado" => 40 },
"perinoor fried meat"           => { "quality certificate" => 1, "trimmed meat" => 50, "peanut" => 100 },
"perinoor potato powder"        => { "quality certificate" => 1, "orchard puree" => 15, "potato" => 100 },
"rainbow polish"                => { "dragon essence stabilizer" => 3, "turmeric" => 50, "aloe" => 50, "sparkling shell dust" => 10, "beechnut" => 10 },
"rookborne basin corn hash"     => { "quality certificate" => 1, "dried flowers" => 50, "corn" => 180 },
"rookborne basin fruit leather" => { "quality certificate" => 1, "chopped produce" => 50, "fig" => 30 },
"rookborne biscuit sticks"      => { "quality certificate" => 1, "orchard puree" => 15, "milk" => 10 },
"rough polish"                  => { "rock salt stabilizer" => 3, "lotus" => 30, "oats" => 30, "antler coral" => 20 },
"sanddeep fried cucumbers"      => { "quality certificate" => 1, "ground grain" => 50, "cucumber" => 200 },
"sanddeep medicinal poultice"   => { "quality certificate" => 1, "medicinal powder" => 15, "avocado" => 45 },
"sanddeep preserved meat"       => { "quality certificate" => 1, "trimmed meat" => 50, "rosemary" => 100 },
"savory soup"                   => { "ground grain" => 3 },
"sealed delphinad cap"          => { "epherium typhoon cap" => 1, "moonlight archeum essence" => 4, "wind spirit leather" => 2, "blue salt hammer" => 5, "deeply colored oil" => 1, "gilda dust" => 11 },
"sealed epherium cap"           => { "magnificent typhoon cap" => 1, "moonlight archeum essence" => 3, "fine leather" => 6, "blue salt hammer" => 3, "emulsified oil" => 1, "gilda dust" => 7 },
"sealed illustrious cap"        => { "conqueror's typhoon cap" => 1, "moonlight archeum crystal" => 3, "fine leather" => 4, "blue salt gloves" => 6, "viscous glossy oil" => 1, "gilda dust" => 2 },
"sealed magnificent cap"        => { "illustrious typhoon cap" => 1, "moonlight archeum essence" => 2, "fine leather" => 5, "blue salt gloves" => 8, "emulsified oil" => 1, "gilda dust" => 4 },
"silent forest dried fruit"     => { "quality certificate" => 1, "orchard puree" => 15, "milk" => 10 },
"silent forest pomme candy"     => { "quality certificate" => 1, "ground spices" => 50, "pomegranate" => 10 },
"silent forest seasonings"      => { "quality certificate" => 1, "medicinal powder" => 50, "garlic" => 100 },
"silver ingot"                  => { "silver ore" => 3 },
"small seed oil"                => { "charcoal stabilizer" => 3, "rice" => 20, "corn" => 20 },
"solid shaft"                   => { "thunderstruck tree" => 2, "sunridge ingot" => 1 },
"solis alchemy oil"             => { "quality certificate" => 1, "medicinal powder" => 50, "yata fur" => 20 },
"solis juice concentrate"       => { "quality certificate" => 1, "medicinal powder" => 50, "jujube" => 10 },
"solis red spice"               => { "quality certificate" => 1, "ground grain" => 50, "saffron" => 40 },
"solzreed braised meat"         => { "quality certificate" => 1, "trimmed meat" => 50, "egg" => 30 },
"solzreed dried food"           => { "quality certificate" => 1, "trimmed meat" => 50, "grape" => 35 },
"solzreed strawberry smoothies" => { "quality certificate" => 1, "ground spices" => 50, "strawberry" => 100 },
"starshard ingot"               => { "sharshard chip" => 3 },
"stone brick"                   => { "raw stone" => 3 },
"strong wheel"                  => { "archeum log" => 2, "sturdy ingot" => 0.5 },
"sturdy ingot"                  => { "iron ingot" => 8, "copper ingot" => 1, "silver ingot" => 1, "opaque polish" => 1 },
"sun's glory"                   => { "midsummer meteor" => 1, "medicinal powder" => 0.8, "cultivated ginseng" => 0.3 },
"sunridge ingot"                => { "sturdy ingot" => 10, "mysterious garden powder" => 5, "rough polish" => 1 },
"sweet soup"                    => { "vegetable soup" => 1, "ground grain" => 3, "pumpkin" => 5 },
"tigerspine grape jam"          => { "quality certificate" => 1, "chopped produce" => 50, "grape" => 30 },
"tigerspine seasoned meat"      => { "quality certificate" => 1, "trimmed meat" => 50, "tomato" => 100 },
"tigerspine tigerspaw pancakes" => { "quality certificate" => 1, "ground grain" => 50, "milk" => 20 },
"time's river"                  => { "meadow stream" => 1, "medicinal powder" => 1.2, "aloe" => 0.3 },
"two crowns cream"              => { "quality certificate" => 1, "medicinal powder" => 50, "milk" => 20 },
"two crowns flowerpots"         => { "quality certificate" => 1, "dried flowers" => 50, "lavender" => 180 },
"two crowns pomme cakes"        => { "quality certificate" => 1, "ground grain" => 50, "pomegranate" => 10 },
"vegetable soup"                => { "whole grain soup" => 1, "ground grain" => 3, "tomato" => 1 },
"veiled flame"                  => { "medicinal powder" => 0.8 },
"villanelle long noodles"       => { "quality certificate" => 1, "chopped produce" => 50, "rice" => 160 },
"villanelle potpourri"          => { "quality certificate" => 1, "dried flowers" => 50, "goat wool" => 25 },
"villanelle preserved cherries" => { "quality certificate" => 1, "dried flowers" => 50, "cherry" => 8 },
"viscous glossy oil"            => { "rock salt stabilizer" => 3, "peanut" => 30, "wheat" => 30, "red coral" => 20 },
"white arden figgy pudding"     => { "quality certificate" => 1, "ground grain" => 50, "fig" => 40 },
"white arden grilled meat"      => { "quality certificate" => 1, "trimmed meat" => 50, "pumpkin" => 100 },
"white arden trail mix"         => { "quality certificate" => 1, "chopped produce" => 50, "milk" => 15 },
"whole grain soup"              => { "savory soup"  => 1, "ground grain" => 3, "barley" => 2 },
"wind spirit leather"           => { "fine leather" => 10, "mysterious garden powder" => 5, "viscous glossy oil" => 1 },
"windscour bitter herbs"        => { "quality certificate" => 1, "medicinal powder" => 50, "mint" => 100 },
"windscour chilled beverages"   => { "quality certificate" => 1, "chopped produce" => 50, "aloe" => 75 },
"windscour hearty jerky"        => { "quality certificate" => 1, "trimmed meat" => 50, "moringa berry" => 8 },
"ynystere bouquets"             => { "quality certificate" => 1, "ground grain" => 50, "rose" => 200 },
"ynystere olive oil"            => { "quality certificate" => 1, "ground spices" => 50, "olive" => 14 },
"ynystere preserves"            => { "quality certificate" => 1, "chopped produce" => 50, "orange" => 8 }
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

    #print "You entered: $input\n";
    #print "Quantity: $qty\n";

    if (not %craft) {
        print "\%craft is undefined.\n";
    } else {
        if (defined $craft{$input}) {
            my %list;
            add_to_list($input, $qty, \%list);

            $input =~ s/\b([\w']+)\b/\u$1/g;
            print "\nMaterials required for: $qty"."x $input\n\n";
            
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

