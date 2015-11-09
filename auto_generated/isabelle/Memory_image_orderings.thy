chapter {* Generated by Lem from memory_image_orderings.lem. *}

theory "Memory_image_orderings" 

imports 
 	 Main
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_num" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_list" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_set" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_function" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_basic_classes" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_bool" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_maybe" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_string" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_assert_extra" 
	 "Show" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_sorting" 
	 "Missing_pervasives" 
	 "Byte_sequence" 
	 "Elf_types_native_uint" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_tuple" 
	 "Elf_header" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_map" 
	 "Elf_program_header_table" 
	 "Elf_section_header_table" 
	 "Elf_interpreted_section" 
	 "Elf_interpreted_segment" 
	 "Elf_symbol_table" 
	 "Elf_file" 
	 "Elf_relocation" 
	 "Multimap" 
	 "Memory_image" 

begin 

(*open import Basic_classes*)
(*open import Function*)
(*open import String*)
(*open import Tuple*)
(*open import Bool*)
(*open import List*)
(*open import Sorting*)
(*open import Map*)
(*open import Set*)
(*open import Multimap*)
(*open import Num*)
(*open import Maybe*)
(*open import Assert_extra*)
(*open import Show*)

(*open import Byte_sequence*)
(*open import Elf_file*)
(*open import Elf_header*)
(*open import Elf_interpreted_segment*)
(*open import Elf_interpreted_section*)
(*open import Elf_program_header_table*)
(*open import Elf_section_header_table*)
(*open import Elf_symbol_table*)
(*open import Elf_types_native_uint*)
(*open import Elf_relocation*)
(*open import Memory_image*)
(* open import Abis *)

(*open import Missing_pervasives*)


(*val elfFileFeatureConstructorToNaturalList : elf_file_feature -> list natural*)
fun elfFileFeatureConstructorToNaturalList  :: " elf_file_feature \<Rightarrow>(nat)list "  where 
     " elfFileFeatureConstructorToNaturalList (ElfHeader(_)) = ( [( 0 :: nat)])"
|" elfFileFeatureConstructorToNaturalList (ElfSectionHeaderTable(_)) = ( [( 1 :: nat)])"
|" elfFileFeatureConstructorToNaturalList (ElfProgramHeaderTable(_)) = ( [( 2 :: nat)])"
|" elfFileFeatureConstructorToNaturalList (ElfSection(_)) = ( [( 3 :: nat)])"
|" elfFileFeatureConstructorToNaturalList (ElfSegment(_)) = ( [( 4 :: nat)])" 
declare elfFileFeatureConstructorToNaturalList.simps [simp del]


definition instance_Memory_image_ToNaturalList_Memory_image_elf_file_feature_dict  :: "(elf_file_feature)ToNaturalList_class "  where 
     " instance_Memory_image_ToNaturalList_Memory_image_elf_file_feature_dict = ((|

  toNaturalList_method = elfFileFeatureConstructorToNaturalList |) )"


(*val elfFileFeatureCompare : elf_file_feature -> elf_file_feature -> Basic_classes.ordering*)
definition elfFileFeatureCompare  :: " elf_file_feature \<Rightarrow> elf_file_feature \<Rightarrow> ordering "  where 
     " elfFileFeatureCompare f1 f2 = ( 
    (case  (elfFileFeatureConstructorToNaturalList f1, elfFileFeatureConstructorToNaturalList f2) of
        ([], []) => failwith (''impossible: elf file feature has empty natural list (case 0)'')
    |   (_, [])  => failwith (''impossible: elf file feature has empty natural list (case 1)'')
    |   ([], _)  => failwith (''impossible: elf file feature has empty natural list (case 2)'')
    |   ((hd1 # tl1), (hd2 # tl2)) => 
            if hd1 < hd2 then LT else if hd1 > hd2 then GT else
                (case  (f1, f2) of
                    (ElfHeader(x1), ElfHeader(x2)) => elf64_header_compare x1 x2
                    | (ElfSectionHeaderTable(x1), ElfSectionHeaderTable(x2)) => (lexicographicCompareBy compare_elf64_section_header_table_entry x1 x2)
                    | (ElfProgramHeaderTable(x1), ElfProgramHeaderTable(x2)) => (lexicographicCompareBy compare_elf64_program_header_table_entry x1 x2)
                    | (ElfSection(x1), ElfSection(x2)) => (pairCompare (genericCompare (op<) (op=)) compare_elf64_interpreted_section x1 x2)
                    | (ElfSegment(x1), ElfSegment(x2)) => (pairCompare (genericCompare (op<) (op=)) compare_elf64_interpreted_segment x1 x2)
                    | _ => failwith (''impossible: tag constructors not equal but natural list heads were equal'')
                )
    ))"


definition instance_Basic_classes_Ord_Memory_image_elf_file_feature_dict  :: "(elf_file_feature)Ord_class "  where 
     " instance_Basic_classes_Ord_Memory_image_elf_file_feature_dict = ((|

  compare_method = elfFileFeatureCompare,

  isLess_method = (\<lambda> f1 .  (\<lambda> f2 .  (elfFileFeatureCompare f1 f2 = LT))),

  isLessEqual_method = (\<lambda> f1 .  (\<lambda> f2 .  (op \<in>) (elfFileFeatureCompare f1 f2) ({LT, EQ}))),

  isGreater_method = (\<lambda> f1 .  (\<lambda> f2 .  (elfFileFeatureCompare f1 f2 = GT))),

  isGreaterEqual_method = (\<lambda> f1 .  (\<lambda> f2 .  (op \<in>) (elfFileFeatureCompare f1 f2) ({GT, EQ})))|) )"


(*val tagConstructorToNaturalList : forall 'abifeature. ToNaturalList 'abifeature => range_tag 'abifeature -> list natural*)
fun tagConstructorToNaturalList  :: " 'abifeature ToNaturalList_class \<Rightarrow> 'abifeature range_tag \<Rightarrow>(nat)list "  where 
     " tagConstructorToNaturalList dict_Memory_image_ToNaturalList_abifeature ImageBase = ( [( 0 :: nat)])"
|" tagConstructorToNaturalList dict_Memory_image_ToNaturalList_abifeature EntryPoint = ( [( 1 :: nat)])"
|" tagConstructorToNaturalList dict_Memory_image_ToNaturalList_abifeature (SymbolDef(_)) = ( [( 2 :: nat)])"
|" tagConstructorToNaturalList dict_Memory_image_ToNaturalList_abifeature (SymbolRef(_)) = ( [( 3 :: nat)])"
|" tagConstructorToNaturalList dict_Memory_image_ToNaturalList_abifeature (FileFeature(f)) = (( 4 :: nat) # (elfFileFeatureConstructorToNaturalList f))"
|" tagConstructorToNaturalList dict_Memory_image_ToNaturalList_abifeature (AbiFeature(af)) = (( 5 :: nat) # (
  (toNaturalList_method   dict_Memory_image_ToNaturalList_abifeature) af))" 
declare tagConstructorToNaturalList.simps [simp del]


definition instance_Memory_image_ToNaturalList_Memory_image_range_tag_dict  :: " 'abifeature ToNaturalList_class \<Rightarrow>('abifeature range_tag)ToNaturalList_class "  where 
     " instance_Memory_image_ToNaturalList_Memory_image_range_tag_dict dict_Memory_image_ToNaturalList_abifeature = ((|

  toNaturalList_method = 
  (tagConstructorToNaturalList dict_Memory_image_ToNaturalList_abifeature) |) )"


(*val tagEquiv : forall 'abifeature. ToNaturalList 'abifeature => range_tag 'abifeature -> range_tag 'abifeature -> bool*)
definition tagEquiv  :: " 'abifeature ToNaturalList_class \<Rightarrow> 'abifeature range_tag \<Rightarrow> 'abifeature range_tag \<Rightarrow> bool "  where 
     " tagEquiv dict_Memory_image_ToNaturalList_abifeature k1 k2 = ( 
    EQ = ((lexicographicCompareBy (genericCompare (op<) (op=)) (tagConstructorToNaturalList 
  dict_Memory_image_ToNaturalList_abifeature k1) (tagConstructorToNaturalList 
  dict_Memory_image_ToNaturalList_abifeature k2))))"


(*val tagCompare : forall 'abifeature. ToNaturalList 'abifeature, Ord 'abifeature => range_tag 'abifeature -> range_tag 'abifeature -> Basic_classes.ordering*)
definition tagCompare  :: " 'abifeature ToNaturalList_class \<Rightarrow> 'abifeature Ord_class \<Rightarrow> 'abifeature range_tag \<Rightarrow> 'abifeature range_tag \<Rightarrow> ordering "  where 
     " tagCompare dict_Memory_image_ToNaturalList_abifeature dict_Basic_classes_Ord_abifeature k1 k2 = ( 
    (case  ((tagConstructorToNaturalList 
  dict_Memory_image_ToNaturalList_abifeature k1), (tagConstructorToNaturalList 
  dict_Memory_image_ToNaturalList_abifeature k2)) of
        ([], []) => failwith (''impossible: tag has empty natural list (case 0)'')
    |   (_, [])  => failwith (''impossible: tag has empty natural list (case 1)'')
    |   ([], _)  => failwith (''impossible: tag has empty natural list (case 2)'')
    |   ((hd1 # tl1), (hd2 # tl2)) => 
            if hd1 < hd2 then LT else if hd1 > hd2 then GT else
                (case  (k1, k2) of
                    (ImageBase, ImageBase) => EQ
                    | (EntryPoint, EntryPoint) => EQ
                    | (SymbolDef(x1), SymbolDef(x2)) => symDefCompare x1 x2
                    | (SymbolRef(x1), SymbolRef(x2)) => symRefAndRelocSiteCompare x1 x2
                    | (FileFeature(x1), FileFeature(x2)) => elfFileFeatureCompare x1 x2
                    | (AbiFeature(x1), AbiFeature(x2)) =>
  (compare_method   dict_Basic_classes_Ord_abifeature) x1 x2
                    | _ => failwith (''impossible: tag constructors not equal but natural list heads were equal'')
                )
    ))"


definition instance_Basic_classes_Ord_Memory_image_range_tag_dict  :: " 'abifeature Ord_class \<Rightarrow> 'abifeature ToNaturalList_class \<Rightarrow>('abifeature range_tag)Ord_class "  where 
     " instance_Basic_classes_Ord_Memory_image_range_tag_dict dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature = ((|

  compare_method = 
  (tagCompare dict_Memory_image_ToNaturalList_abifeature
     dict_Basic_classes_Ord_abifeature),

  isLess_method = (\<lambda> tag1 .  (\<lambda> tag2 .  (tagCompare 
  dict_Memory_image_ToNaturalList_abifeature dict_Basic_classes_Ord_abifeature tag1 tag2 = LT))),

  isLessEqual_method = (\<lambda> tag1 .  (\<lambda> tag2 .  (op \<in>) (tagCompare 
  dict_Memory_image_ToNaturalList_abifeature dict_Basic_classes_Ord_abifeature tag1 tag2) ({LT, EQ}))),

  isGreater_method = (\<lambda> tag1 .  (\<lambda> tag2 .  (tagCompare 
  dict_Memory_image_ToNaturalList_abifeature dict_Basic_classes_Ord_abifeature tag1 tag2 = GT))),

  isGreaterEqual_method = (\<lambda> tag1 .  (\<lambda> tag2 .  (op \<in>) (tagCompare 
  dict_Memory_image_ToNaturalList_abifeature dict_Basic_classes_Ord_abifeature tag1 tag2) ({GT, EQ})))|) )"


(* ------- end of Ord / compare / ConstructorToNaturalList functions *)


(*val unique_tag_matching : forall 'abifeature. Ord 'abifeature, ToNaturalList 'abifeature => range_tag 'abifeature -> annotated_memory_image 'abifeature -> range_tag 'abifeature*)
definition unique_tag_matching  :: " 'abifeature Ord_class \<Rightarrow> 'abifeature ToNaturalList_class \<Rightarrow> 'abifeature range_tag \<Rightarrow> 'abifeature annotated_memory_image \<Rightarrow> 'abifeature range_tag "  where 
     " unique_tag_matching dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature tag img = ( 
    (case  Multimap.lookupBy0 
  (instance_Basic_classes_Ord_Memory_image_range_tag_dict
     dict_Basic_classes_Ord_abifeature
     dict_Memory_image_ToNaturalList_abifeature) (instance_Basic_classes_Ord_Maybe_maybe_dict
   (instance_Basic_classes_Ord_tup2_dict
      Lem_string_extra.instance_Basic_classes_Ord_string_dict
      (instance_Basic_classes_Ord_tup2_dict
         instance_Basic_classes_Ord_Num_natural_dict
         instance_Basic_classes_Ord_Num_natural_dict)))  (tagEquiv dict_Memory_image_ToNaturalList_abifeature) tag(by_tag   img) of
        [] => failwith (''no tag match found'')
        | [(t, r)] => t
        | x => failwith ((''more than one tag match'')) (* (ranges:  ^ 
            (show (List.map (fun (t, r) -> r) x))
            ^  ) when asserted unique) *)
    ))"

    
(*val tagged_ranges_matching_tag : forall 'abifeature. Ord 'abifeature, ToNaturalList 'abifeature => range_tag 'abifeature -> annotated_memory_image 'abifeature -> list (range_tag 'abifeature * maybe element_range)*)
definition tagged_ranges_matching_tag  :: " 'abifeature Ord_class \<Rightarrow> 'abifeature ToNaturalList_class \<Rightarrow> 'abifeature range_tag \<Rightarrow> 'abifeature annotated_memory_image \<Rightarrow>('abifeature range_tag*(element_range)option)list "  where 
     " tagged_ranges_matching_tag dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature tag img = ( 
    Multimap.lookupBy0 
  (instance_Basic_classes_Ord_Memory_image_range_tag_dict
     dict_Basic_classes_Ord_abifeature
     dict_Memory_image_ToNaturalList_abifeature) (instance_Basic_classes_Ord_Maybe_maybe_dict
   (instance_Basic_classes_Ord_tup2_dict
      Lem_string_extra.instance_Basic_classes_Ord_string_dict
      (instance_Basic_classes_Ord_tup2_dict
         instance_Basic_classes_Ord_Num_natural_dict
         instance_Basic_classes_Ord_Num_natural_dict)))  (tagEquiv dict_Memory_image_ToNaturalList_abifeature) tag(by_tag   img))"


(*val element_range_compare : element_range -> element_range -> Basic_classes.ordering*)
definition element_range_compare  :: " string*(nat*nat) \<Rightarrow> string*(nat*nat) \<Rightarrow> ordering "  where 
     " element_range_compare = ( pairCompare (\<lambda> x y. EQ) (pairCompare (genericCompare (op<) (op=)) (genericCompare (op<) (op=))))"


(*val unique_tag_matching_at_range_exact : forall 'abifeature. Ord 'abifeature, ToNaturalList 'abifeature =>
    maybe element_range
    -> range_tag 'abifeature
    -> annotated_memory_image 'abifeature
    -> range_tag 'abifeature*)
definition unique_tag_matching_at_range_exact  :: " 'abifeature Ord_class \<Rightarrow> 'abifeature ToNaturalList_class \<Rightarrow>(element_range)option \<Rightarrow> 'abifeature range_tag \<Rightarrow> 'abifeature annotated_memory_image \<Rightarrow> 'abifeature range_tag "  where 
     " unique_tag_matching_at_range_exact dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature r tag img = ( 
    (* 1. find tags a unique range labelled as ELF section header table. *)
    (let (_, (allRangeMatches :: ( 'abifeature range_tag) list)) = (list_unzip (Multimap.lookupBy0 
  (instance_Basic_classes_Ord_Maybe_maybe_dict
     (instance_Basic_classes_Ord_tup2_dict
        Lem_string_extra.instance_Basic_classes_Ord_string_dict
        (instance_Basic_classes_Ord_tup2_dict
           instance_Basic_classes_Ord_Num_natural_dict
           instance_Basic_classes_Ord_Num_natural_dict))) (instance_Basic_classes_Ord_Memory_image_range_tag_dict
   dict_Basic_classes_Ord_abifeature
   dict_Memory_image_ToNaturalList_abifeature) (op=) r(by_range   img)))
    in
    (let (tagAlsoMatches :: ( 'abifeature range_tag) list) = (List.filter (\<lambda> x .  tagEquiv 
  dict_Memory_image_ToNaturalList_abifeature x tag) allRangeMatches)
    in
    (case  tagAlsoMatches of
        [] => failwith (''no range/tag match when asserted to exist'')
        | [x] => x
        | _ => failwith (''multiple range/tag match when asserted unique'')
    ))))"


(*val symbol_def_ranges : forall 'abifeature. Ord 'abifeature, ToNaturalList 'abifeature => annotated_memory_image 'abifeature -> (list (range_tag 'abifeature) * list (maybe element_range))*)
definition symbol_def_ranges  :: " 'abifeature Ord_class \<Rightarrow> 'abifeature ToNaturalList_class \<Rightarrow> 'abifeature annotated_memory_image \<Rightarrow>('abifeature range_tag)list*((element_range)option)list "  where 
     " symbol_def_ranges dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature img = ( 
    (* find all element ranges labelled as ELF symbols *)
    (let (tags, maybe_ranges) = (list_unzip (
        tagged_ranges_matching_tag 
  dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature (SymbolDef(null_symbol_definition)) img
    ))
    in
    (* some symbols, specifically ABS symbols, needn't label a range. *)
    (tags, maybe_ranges)))"


(*val name_of_symbol_def : symbol_definition -> string*)
definition name_of_symbol_def  :: " symbol_definition \<Rightarrow> string "  where 
     " name_of_symbol_def sym1 = ((def_symname   sym1))"


(*val defined_symbols_and_ranges : forall 'abifeature. Ord 'abifeature, ToNaturalList 'abifeature => annotated_memory_image 'abifeature -> list ((maybe element_range) * symbol_definition)*)
definition defined_symbols_and_ranges  :: " 'abifeature Ord_class \<Rightarrow> 'abifeature ToNaturalList_class \<Rightarrow> 'abifeature annotated_memory_image \<Rightarrow>((element_range)option*symbol_definition)list "  where 
     " defined_symbols_and_ranges dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature img = ( 
    Lem_list.mapMaybe (\<lambda> (tag, maybeRange) .  
        (case  tag of
            SymbolDef(ent) => Some (maybeRange, ent)
            | _ => failwith (''impossible: non-symbol def in list of symbol defs'')
        )) (tagged_ranges_matching_tag 
  dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature (SymbolDef(null_symbol_definition)) img))"


(*val defined_symbols : forall 'abifeature. Ord 'abifeature, ToNaturalList 'abifeature =>  annotated_memory_image 'abifeature -> list symbol_definition*)
definition defined_symbols  :: " 'abifeature Ord_class \<Rightarrow> 'abifeature ToNaturalList_class \<Rightarrow> 'abifeature annotated_memory_image \<Rightarrow>(symbol_definition)list "  where 
     " defined_symbols dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature img = ( 
    (let ((all_symbol_tags, all_symbol_ranges) :: ( ( 'abifeature range_tag)list * ( element_range option) list))
     = (symbol_def_ranges 
  dict_Basic_classes_Ord_abifeature dict_Memory_image_ToNaturalList_abifeature img)
    in
    Lem_list.mapMaybe (\<lambda> tag .  
        (case  tag of
            SymbolDef(ent) => Some ent
            | _ => failwith (''impossible: non-symbol def in list of symbol defs'')
        )) all_symbol_tags))"

end