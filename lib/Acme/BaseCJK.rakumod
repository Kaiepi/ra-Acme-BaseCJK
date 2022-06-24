use v6;
unit module Acme::BaseCJK:ver<0.0.1>:auth<zef:Kaiepi>:api<13.0.0>;

my constant @OF =
    (0x04E00..0x09FFC), # CJK Unified Ideographs
    (0x03400..0x04DBF), # CJK Unified Ideographs Extension A
    (0x20000..0x2A6DD), # CJK Unified Ideographs Extension B
    (0x2A700..0x2B734), # CJK Unified Ideographs Extension C
    (0x2B740..0x2B81D), # CJK Unified Ideographs Extension D
    (0x2B820..0x2CEA1), # CJK Unified Ideographs Extension E
    (0x2CEB0..0x2EBE0), # CJK Unified Ideographs Extension F
    (0x30000..0x3134A), # CJK Unified Ideographs Extension G
;

my constant @TO = @OF.map: *.bounds.map(*.chr .. *.chr);

my constant %OF = Map.new: @OF.flat.kv.map(* => *.chr);

my constant %TO = Map.new: @TO.flat.antipairs;

subset String of Str:D where .comb.all ~~ %TO;

proto term:<CJK>(*%) is export {*}
multi term:<CJK>(Int(Cool:D) :$of! --> Str:D) {
    $of.polymod(92_844 xx *).reverse.map({ %OF{$_} }).join
}
multi term:<CJK>(String :$to! --> Int:D) {
    $to.comb.map({ %TO{$_} }).reduce(* * 92_844 + *)
}
