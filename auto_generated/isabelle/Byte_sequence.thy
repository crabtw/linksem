chapter {* Generated by Lem from byte_sequence.lem. *}

theory "Byte_sequence" 

imports 
 	 Main
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_num" 
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_list" 
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_basic_classes" 
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_bool" 
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_string" 
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_assert_extra" 
	 "Show" 
	 "Missing_pervasives" 
	 "Error" 

begin 

(*open import Basic_classes*)
(*open import Bool*)
(*open import List*)
(*open import Num*)
(*open import String*)
(*open import Assert_extra*)

(*open import Error*)
(*open import Missing_pervasives*)
(*open import Show*)

datatype byte_sequence =
  Sequence " Elf_Types_Local.byte list "

(*val byte_list_of_byte_sequence : byte_sequence -> list byte*)
fun byte_list_of_byte_sequence  :: " byte_sequence \<Rightarrow>(Elf_Types_Local.byte)list "  where 
     " byte_list_of_byte_sequence (Sequence xs) = ( xs )" 
declare byte_list_of_byte_sequence.simps [simp del]


definition compare_byte_sequence  :: " byte_sequence \<Rightarrow> byte_sequence \<Rightarrow> ordering "  where 
     " compare_byte_sequence s1 s2 = ( (lexicographicCompareBy compare_byte (byte_list_of_byte_sequence s1) (byte_list_of_byte_sequence s2)))"


definition instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict  :: "(byte_sequence)Ord_class "  where 
     " instance_Basic_classes_Ord_Byte_sequence_byte_sequence_dict = ((|

  compare_method = compare_byte_sequence,

  isLess_method = (\<lambda> f1 .  (\<lambda> f2 .  (compare_byte_sequence f1 f2 = LT))),

  isLessEqual_method = (\<lambda> f1 .  (\<lambda> f2 .  (let result = (compare_byte_sequence f1 f2) in (result = LT) \<or> (result = EQ)))),

  isGreater_method = (\<lambda> f1 .  (\<lambda> f2 .  (compare_byte_sequence f1 f2 = GT))),

  isGreaterEqual_method = (\<lambda> f1 .  (\<lambda> f2 .  (let result = (compare_byte_sequence f1 f2) in (result = GT) \<or> (result = EQ))))|) )"


(*val acquire_byte_list : string -> error (list byte)*)

(*val acquire : string -> error byte_sequence*)

(*val serialise_byte_list : string -> list byte -> error unit*)

(*val serialise : string -> byte_sequence -> error unit*)

(*val empty : byte_sequence*)
definition empty  :: " byte_sequence "  where 
     " empty = ( Sequence [])"


(*val read_char : byte_sequence -> error (byte * byte_sequence)*)
fun read_char  :: " byte_sequence \<Rightarrow>(Elf_Types_Local.byte*byte_sequence)error "  where 
     " read_char (Sequence([])) = ( error_fail (''read_char: sequence is empty''))"
|" read_char (Sequence(x # xs)) = ( error_return (x, Sequence xs))" 
declare read_char.simps [simp del]


(*val repeat : natural -> byte -> list byte*)
function (sequential,domintros)  repeat  :: " nat \<Rightarrow> Elf_Types_Local.byte \<Rightarrow>(Elf_Types_Local.byte)list "  where 
     " repeat count1 c = (
  (case  count1 of
      0 => []
    | m => c # repeat (count1 -( 1 :: nat)) c
  ))" 
by pat_completeness auto


(*val create : natural -> byte -> byte_sequence*)
definition create  :: " nat \<Rightarrow> Elf_Types_Local.byte \<Rightarrow> byte_sequence "  where 
     " create count1 c = (
  Sequence (repeat count1 c))"


(*val zeros : natural -> byte_sequence*)
definition zeros  :: " nat \<Rightarrow> byte_sequence "  where 
     " zeros m = (
  create m (0 :: 8 word))"


(*val length : byte_sequence -> natural*)
fun length0  :: " byte_sequence \<Rightarrow> nat "  where 
     " length0 (Sequence ts) = (
   (List.length ts))" 
declare length0.simps [simp del]



(*val concat : list byte_sequence -> byte_sequence*)
function (sequential,domintros)  concat_byte_sequence  :: "(byte_sequence)list \<Rightarrow> byte_sequence "  where 
     " concat_byte_sequence ([]) = ( Sequence [])"
|" concat_byte_sequence ((Sequence x)# xs) = (
      (case  concat_byte_sequence xs of
          Sequence tail => Sequence (x @ tail)
      ))" 
by pat_completeness auto


(*val zero_pad_to_length : natural -> byte_sequence -> byte_sequence*)
definition zero_pad_to_length  :: " nat \<Rightarrow> byte_sequence \<Rightarrow> byte_sequence "  where 
     " zero_pad_to_length len bs = ( 
  (let curlen = (length0 bs) in 
    if curlen \<ge> len then
      bs
    else
      concat_byte_sequence [bs , (zeros (len - curlen))]))"


(*val from_byte_lists : list (list byte) -> byte_sequence*)
definition from_byte_lists  :: "((Elf_Types_Local.byte)list)list \<Rightarrow> byte_sequence "  where 
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
  if count1 = Missing_pervasives.naturalZero then
    error_return (Sequence ts)
  else
    (case  ts of
        []    => error_fail (''dropbytes: cannot drop more bytes than are contained in sequence'')
      | x # xs => dropbytes (count1 -( 1 :: nat)) (Sequence xs)
    ))" 
by pat_completeness auto


(*val takebytes_r_with_length: nat -> natural -> byte_sequence -> error byte_sequence*)
fun  takebytes_r_with_length  :: " nat \<Rightarrow> nat \<Rightarrow> byte_sequence \<Rightarrow>(byte_sequence)error "  where 
     " takebytes_r_with_length count1 ts_length (Sequence ts) = ( 
  if ts_length \<ge> ( count1) then 
    error_return (Sequence (list_take_with_accum count1 [] ts))
  else
    error_fail (''takebytes: cannot take more bytes than are contained in sequence''))" 
declare takebytes_r_with_length.simps [simp del]


(*val takebytes : natural -> byte_sequence -> error byte_sequence*)
fun takebytes  :: " nat \<Rightarrow> byte_sequence \<Rightarrow>(byte_sequence)error "  where 
     " takebytes count1 (Sequence ts) = (
  (* let _ = Missing_pervasives.errs (Trying to take  ^ (show count) ^  bytes from sequence of  ^ (show (List.length ts)) ^ n) in *)
  (let result = (takebytes_r_with_length (id count1) (List.length ts) (Sequence ts)) in 
  (*let _ = Missing_pervasives.errs (Succeededn) in *)
    result))" 
declare takebytes.simps [simp del]


(*val takebytes_with_length : natural -> natural -> byte_sequence -> error byte_sequence*)
fun takebytes_with_length  :: " nat \<Rightarrow> nat \<Rightarrow> byte_sequence \<Rightarrow>(byte_sequence)error "  where 
     " takebytes_with_length count1 ts_length (Sequence ts) = (
  (* let _ = Missing_pervasives.errs (Trying to take  ^ (show count) ^  bytes from sequence of  ^ (show (List.length ts)) ^ n) in *)
  (let result = (takebytes_r_with_length (id count1) ts_length (Sequence ts)) in 
  (*let _ = Missing_pervasives.errs (Succeededn) in *)
    result))" 
declare takebytes_with_length.simps [simp del]


(*val read_2_bytes_le : byte_sequence -> error ((byte * byte) * byte_sequence)*)
definition read_2_bytes_le  :: " byte_sequence \<Rightarrow>((Elf_Types_Local.byte*Elf_Types_Local.byte)*byte_sequence)error "  where 
     " read_2_bytes_le bs0 = (
  read_char bs0 >>= (\<lambda> (b0, bs1) . 
  read_char bs1 >>= (\<lambda> (b1, bs2) . 
  error_return ((b1, b0), bs2))))"


(*val read_2_bytes_be : byte_sequence -> error ((byte * byte) * byte_sequence)*)
definition read_2_bytes_be  :: " byte_sequence \<Rightarrow>((Elf_Types_Local.byte*Elf_Types_Local.byte)*byte_sequence)error "  where 
     " read_2_bytes_be bs0 = (
  read_char bs0 >>= (\<lambda> (b0, bs1) . 
  read_char bs1 >>= (\<lambda> (b1, bs2) . 
  error_return ((b0, b1), bs2))))"


(*val read_4_bytes_le : byte_sequence -> error ((byte * byte * byte * byte) * byte_sequence)*)
definition read_4_bytes_le  :: " byte_sequence \<Rightarrow>((Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte)*byte_sequence)error "  where 
     " read_4_bytes_le bs0 = (
  read_char bs0 >>= (\<lambda> (b0, bs1) . 
  read_char bs1 >>= (\<lambda> (b1, bs2) . 
  read_char bs2 >>= (\<lambda> (b2, bs3) . 
  read_char bs3 >>= (\<lambda> (b3, bs4) . 
  error_return ((b3, b2, b1, b0), bs4))))))"


(*val read_4_bytes_be : byte_sequence -> error ((byte * byte * byte * byte) * byte_sequence)*)
definition read_4_bytes_be  :: " byte_sequence \<Rightarrow>((Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte)*byte_sequence)error "  where 
     " read_4_bytes_be bs0 = (
  read_char bs0 >>= (\<lambda> (b0, bs1) . 
  read_char bs1 >>= (\<lambda> (b1, bs2) . 
  read_char bs2 >>= (\<lambda> (b2, bs3) . 
  read_char bs3 >>= (\<lambda> (b3, bs4) . 
  error_return ((b0, b1, b2, b3), bs4))))))"


(*val read_8_bytes_le : byte_sequence -> error ((byte * byte * byte * byte * byte * byte * byte * byte) * byte_sequence)*)
definition read_8_bytes_le  :: " byte_sequence \<Rightarrow>((Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte)*byte_sequence)error "  where 
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
definition read_8_bytes_be  :: " byte_sequence \<Rightarrow>((Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte*Elf_Types_Local.byte)*byte_sequence)error "  where 
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
definition partition0  :: " nat \<Rightarrow> byte_sequence \<Rightarrow>(byte_sequence*byte_sequence)error "  where 
     " partition0 idx bs0 = (
  takebytes idx bs0 >>= (\<lambda> l . 
  dropbytes idx bs0 >>= (\<lambda> r . 
  error_return (l, r))))"


(*val partition_with_length : natural -> natural -> byte_sequence -> error (byte_sequence * byte_sequence)*)
definition partition_with_length  :: " nat \<Rightarrow> nat \<Rightarrow> byte_sequence \<Rightarrow>(byte_sequence*byte_sequence)error "  where 
     " partition_with_length idx bs0_length bs0 = (
  takebytes_with_length idx bs0_length bs0 >>= (\<lambda> l . 
  dropbytes idx bs0 >>= (\<lambda> r . 
  error_return (l, r))))"


(*val offset_and_cut : natural -> natural -> byte_sequence -> error byte_sequence*)
definition offset_and_cut  :: " nat \<Rightarrow> nat \<Rightarrow> byte_sequence \<Rightarrow>(byte_sequence)error "  where 
     " offset_and_cut off cut1 bs0 = (
  dropbytes off bs0 >>= (\<lambda> bs1 . 
  takebytes cut1 bs1 >>= (\<lambda> res . 
  error_return res)))"

end
