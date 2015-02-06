header{*Generated by Lem from byte_sequence.lem.*}

theory "Byte_sequence" 

imports 
 	 Main
	 "Lem_basic_classes" 
	 "Lem_bool" 
	 "Lem_list" 
	 "Lem_num" 
	 "Lem_string" 
	 "Error" 
	 "Missing_pervasives" 
	 "Show" 

begin 

(*open import Basic_classes*)
(*open import Bool*)
(*open import List*)
(*open import Num*)
(*open import String*)

(*open import Error*)
(*open import Missing_pervasives*)
(*open import Show*)

datatype byte_sequence =
  Sequence "  8 word list "

(*val acquire_byte_list : string -> error (list byte)*)

(*val acquire : string -> error byte_sequence*)

(*val serialise_byte_list : string -> list byte -> error unit*)

(*val serialise : string -> byte_sequence -> error unit*)

(*val empty : byte_sequence*)
definition empty  :: " byte_sequence "  where 
     " empty = ( Sequence [])"


(*val read_char : byte_sequence -> error (byte * byte_sequence)*)
fun read_char  :: " byte_sequence \<Rightarrow>( 8 word*byte_sequence)error "  where 
     " read_char (Sequence([])) = ( error_fail (''read_char: sequence is empty''))"
|" read_char (Sequence(x # xs)) = ( error_return (x, Sequence xs))" 
declare read_char.simps [simp del]


(*val repeat : natural -> byte -> list byte*)
function (sequential,domintros)  repeat  :: " nat \<Rightarrow> 8 word \<Rightarrow>( 8 word)list "  where 
     " repeat count1 c = (
  (case  count1 of
      0 => []
    | m => c # repeat (count1 -( 1 :: nat)) c
  ))" 
by pat_completeness auto

termination by lexicographic_order


(*val create : natural -> byte -> byte_sequence*)
definition create  :: " nat \<Rightarrow> 8 word \<Rightarrow> byte_sequence "  where 
     " create count1 c = (
  Sequence (repeat count1 c))"


(*val zeros : natural -> byte_sequence*)
definition zeros  :: " nat \<Rightarrow> byte_sequence "  where 
     " zeros m = ( create m (0 :: 8 word))"


(*val length : byte_sequence -> natural*)
fun length  :: " byte_sequence \<Rightarrow> nat "  where 
     " length (Sequence ts) = (
  List.foldr (\<lambda> x y .  y +( 1 :: nat)) ts (( 0 :: nat)))" 
declare length.simps [simp del]

;;

(*val concat : list byte_sequence -> byte_sequence*)
function (sequential,domintros)  concat_byte_sequence  :: "(byte_sequence)list \<Rightarrow> byte_sequence "  where 
     " concat_byte_sequence ([]) = ( Sequence [])"
|" concat_byte_sequence ((Sequence x)# xs) = (
      (case  concat_byte_sequence xs of
          Sequence tail => Sequence (x @ tail)
      ))" 
by pat_completeness auto

termination by lexicographic_order

(*val from_byte_lists : list (list byte) -> byte_sequence*)
definition from_byte_lists  :: "(( 8 word)list)list \<Rightarrow> byte_sequence "  where 
     " from_byte_lists ts = (
  Sequence (List.concat ts))"


(*val string_of_char_list : list char -> string*)

(*val char_list_of_byte_list : list byte -> list char*)

(*val string_of_byte_sequence : byte_sequence -> string*)
fun string_of_byte_sequence  :: " byte_sequence \<Rightarrow> string "  where 
     " string_of_byte_sequence (Sequence ts) = (
  (let cs = (List.map undefined ts) in 
    cs))" 
declare string_of_byte_sequence.simps [simp del]


(*val equal : byte_sequence -> byte_sequence -> bool*)
(*let rec equal left right =
  match (left, right) with
    | (Sequence [], Sequence []) -> true
    | (Sequence (x::xs), Sequence (y::ys)) ->
        (Instance_Basic_classes_Eq_var.=) x y && equal (Sequence xs) (Sequence ys)
    | (_, _) -> false
  end*)

(*val dropbytes : natural -> byte_sequence -> error byte_sequence*)
function (sequential,domintros)  dropbytes  :: " nat \<Rightarrow> byte_sequence \<Rightarrow>(byte_sequence)error "  where 
     " dropbytes count1 (Sequence ts) = (
  (case  count1 of
      0 => error_return (Sequence ts)
    | m =>
      (case  ts of
          []    =>
          error_fail (''dropbytes: cannot drop more bytes than are contained in sequence'')
        | x # xs =>
          dropbytes (count1 -( 1 :: nat)) (Sequence xs)
      )
  ))" 
by pat_completeness auto

termination by lexicographic_order


(*val takebytes : natural -> byte_sequence -> error byte_sequence*)
function (sequential,domintros)  takebytes  :: " nat \<Rightarrow> byte_sequence \<Rightarrow>(byte_sequence)error "  where 
     " takebytes count1 (Sequence ts) = (
  (case  count1 of
      0 => error_return (Sequence [])
    | m =>
      (case  ts of
          [] =>
          error_fail (''takebytes: cannot take more bytes than are contained in sequence'')
        | x # xs =>
          takebytes (count1 -( 1 :: nat)) (Sequence xs) >>= (\<lambda> tail . 
          (case  tail of
              Sequence t => error_return (Sequence (x # t))
          ))
      )
  ))" 
by pat_completeness auto

termination by lexicographic_order


(*val read_2_bytes_le : byte_sequence -> error ((byte * byte) * byte_sequence)*)
definition read_2_bytes_le  :: " byte_sequence \<Rightarrow>(( 8 word* 8 word)*byte_sequence)error "  where 
     " read_2_bytes_le bs0 = (
  read_char bs0 >>= (\<lambda> (b0, bs1) . 
  read_char bs1 >>= (\<lambda> (b1, bs2) . 
  error_return ((b1, b0), bs2))))"


(*val read_2_bytes_be : byte_sequence -> error ((byte * byte) * byte_sequence)*)
definition read_2_bytes_be  :: " byte_sequence \<Rightarrow>(( 8 word* 8 word)*byte_sequence)error "  where 
     " read_2_bytes_be bs0 = (
  read_char bs0 >>= (\<lambda> (b0, bs1) . 
  read_char bs1 >>= (\<lambda> (b1, bs2) . 
  error_return ((b0, b1), bs2))))"


(*val read_4_bytes_le : byte_sequence -> error ((byte * byte * byte * byte) * byte_sequence)*)
definition read_4_bytes_le  :: " byte_sequence \<Rightarrow>(( 8 word* 8 word* 8 word* 8 word)*byte_sequence)error "  where 
     " read_4_bytes_le bs0 = (
  read_char bs0 >>= (\<lambda> (b0, bs1) . 
  read_char bs1 >>= (\<lambda> (b1, bs2) . 
  read_char bs2 >>= (\<lambda> (b2, bs3) . 
  read_char bs3 >>= (\<lambda> (b3, bs4) . 
  error_return ((b3, b2, b1, b0), bs4))))))"


(*val read_4_bytes_be : byte_sequence -> error ((byte * byte * byte * byte) * byte_sequence)*)
definition read_4_bytes_be  :: " byte_sequence \<Rightarrow>(( 8 word* 8 word* 8 word* 8 word)*byte_sequence)error "  where 
     " read_4_bytes_be bs0 = (
  read_char bs0 >>= (\<lambda> (b0, bs1) . 
  read_char bs1 >>= (\<lambda> (b1, bs2) . 
  read_char bs2 >>= (\<lambda> (b2, bs3) . 
  read_char bs3 >>= (\<lambda> (b3, bs4) . 
  error_return ((b0, b1, b2, b3), bs4))))))"


(*val read_8_bytes_le : byte_sequence -> error ((byte * byte * byte * byte * byte * byte * byte * byte) * byte_sequence)*)
definition read_8_bytes_le  :: " byte_sequence \<Rightarrow>(( 8 word* 8 word* 8 word* 8 word* 8 word* 8 word* 8 word* 8 word)*byte_sequence)error "  where 
     " read_8_bytes_le bs0 = (
  read_char bs0 >>= (\<lambda> (b0, bs1) . 
  read_char bs1 >>= (\<lambda> (b1, bs2) . 
  read_char bs2 >>= (\<lambda> (b2, bs3) . 
  read_char bs3 >>= (\<lambda> (b3, bs4) . 
  read_char bs4 >>= (\<lambda> (b4, bs5) . 
  read_char bs5 >>= (\<lambda> (b5, bs6) . 
  read_char bs6 >>= (\<lambda> (b6, bs7) . 
  read_char bs7 >>= (\<lambda> (b7, bs8) . 
  error_return ((b7, b6, b5, b4, b3, b2, b1, b0), bs8))))))))))"


(*val read_8_bytes_be : byte_sequence -> error ((byte * byte * byte * byte * byte * byte * byte * byte) * byte_sequence)*)
definition read_8_bytes_be  :: " byte_sequence \<Rightarrow>(( 8 word* 8 word* 8 word* 8 word* 8 word* 8 word* 8 word* 8 word)*byte_sequence)error "  where 
     " read_8_bytes_be bs0 = (
  read_char bs0 >>= (\<lambda> (b0, bs1) . 
  read_char bs1 >>= (\<lambda> (b1, bs2) . 
  read_char bs2 >>= (\<lambda> (b2, bs3) . 
  read_char bs3 >>= (\<lambda> (b3, bs4) . 
  read_char bs4 >>= (\<lambda> (b4, bs5) . 
  read_char bs5 >>= (\<lambda> (b5, bs6) . 
  read_char bs6 >>= (\<lambda> (b6, bs7) . 
  read_char bs7 >>= (\<lambda> (b7, bs8) . 
  error_return ((b0, b1, b2, b3, b4, b5, b6, b7), bs8))))))))))"


(*val partition : natural -> byte_sequence -> error (byte_sequence * byte_sequence)*)
definition partition  :: " nat \<Rightarrow> byte_sequence \<Rightarrow>(byte_sequence*byte_sequence)error "  where 
     " partition idx bs0 = (
  takebytes idx bs0 >>= (\<lambda> l . 
  dropbytes idx bs0 >>= (\<lambda> r . 
  error_return (l, r))))"


(*val offset_and_cut : natural -> natural -> byte_sequence -> error byte_sequence*)
definition offset_and_cut  :: " nat \<Rightarrow> nat \<Rightarrow> byte_sequence \<Rightarrow>(byte_sequence)error "  where 
     " offset_and_cut off cut1 bs0 = (
  dropbytes off bs0 >>= (\<lambda> bs1 . 
  takebytes cut1 bs1 >>= (\<lambda> res . 
  error_return res)))"
end
