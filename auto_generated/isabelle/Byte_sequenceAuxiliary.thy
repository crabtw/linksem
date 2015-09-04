chapter {* Generated by Lem from byte_sequence.lem. *}

theory "Byte_sequenceAuxiliary" 

imports 
 	 Main "~~/src/HOL/Library/Code_Target_Numeral"
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_num" 
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_list" 
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_basic_classes" 
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_bool" 
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_string" 
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_assert_extra" 
	 "Show" 
	 "Missing_pervasives" 
	 "Error" 
	 "Byte_sequence" 

begin 


(****************************************************)
(*                                                  *)
(* Termination Proofs                               *)
(*                                                  *)
(****************************************************)

termination repeat by lexicographic_order

termination concat_byte_sequence by lexicographic_order

termination dropbytes by lexicographic_order


(****************************************************)
(*                                                  *)
(* Lemmata                                          *)
(*                                                  *)
(****************************************************)

lemma equal_def_lemma:
" ((\<forall> right. \<forall> left.
   (case  (left, right) of
         (Sequence [], Sequence []) => True
     | (Sequence (x # xs), Sequence (y # ys)) =>
   (x = y) \<and> (Sequence xs) = (Sequence ys)
     | (_, _) => False
   ) = left = right)) "
(* Theorem: equal_def_lemma*)(* try *) by auto



end
