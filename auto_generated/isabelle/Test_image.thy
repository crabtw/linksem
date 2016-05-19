chapter {* Generated by Lem from test_image.lem. *}

theory "Test_image" 

imports 
 	 Main
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_list" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_set" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_basic_classes" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_maybe" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_assert_extra" 
	 "Show" 
	 "Missing_pervasives" 
	 "Error" 
	 "Byte_sequence" 
	 "Elf_types_native_uint" 
	 "Elf_header" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/lem/isabelle-lib/Lem_map" 
	 "Elf_program_header_table" 
	 "Elf_interpreted_segment" 
	 "Elf_symbol_table" 
	 "Elf_file" 
	 "Elf_relocation" 
	 "Memory_image" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Abi_amd64_relocation" 
	 "/auto/homes/dpm36/Work/Cambridge/bitbucket/linksem/auto_generated/isabelle/Abis" 
	 "Elf_memory_image" 
	 "Command_line" 
	 "Input_list" 
	 "Linkable_list" 
	 "Elf64_file_of_elf_memory_image" 
	 "Link" 

begin 

(*open import Basic_classes*)
(*open import List*)
(*open import Map*)
(*open import Maybe*)
(*open import Set*)
(*open import Missing_pervasives*)

(*open import Assert_extra*)

(*open import Error*)
(*open import Elf64_file_of_elf_memory_image*)

(*open import Elf_relocation*)
(*open import Elf_header*)
(*open import Elf_file*)
(*open import Elf_interpreted_segment*)
(*open import Elf_program_header_table*)
(*open import Elf_symbol_table*)
(*open import Elf_types_native_uint*)

(*open import Abi_amd64_relocation*)
(*open import Abis*)

(*open import Elf_memory_image*)
(*open import Memory_image*)

(*open import Command_line*)
(*open import Input_list*)
(*open import Linkable_list*)
(*open import Byte_sequence*)
(*open import Link*)

(*open import Show*)

definition ref_rec0  :: " symbol_reference "  where 
     " ref_rec0 = ( (| ref_symname = (''test'')                  (* symbol name *)
               , ref_syment =                  
((| elf64_st_name  = (Elf_Types_Local.uint32_of_nat(( 0 :: nat)))
                   , elf64_st_info  = (Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)))
                   , elf64_st_other = (Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)))
                   , elf64_st_shndx = (Elf_Types_Local.uint16_of_nat shn_undef)
                   , elf64_st_value = (Elf_Types_Local.uint64_of_nat(( 0 :: nat)))
                   , elf64_st_size  = (of_int (int (( 0 :: nat))))
                   |))
               , ref_sym_scn =(( 0 :: nat))
               , ref_sym_idx =(( 0 :: nat))
               |) )"


(* the record representing the symbol reference and relocation site *)
definition ref_and_reloc_rec0  :: " symbol_reference_and_reloc_site "  where 
     " ref_and_reloc_rec0 = (
 (|
    ref = ref_rec0
    , maybe_reloc = (Some(
      (|
            ref_relent  =                
 ((| elf64_ra_offset = (Elf_Types_Local.uint64_of_nat(( 0 :: nat)))
                 , elf64_ra_info   = (of_int (int r_x86_64_pc32))
                 , elf64_ra_addend = (of_int(( 0 :: int)))
                 |))
          , ref_rel_scn =(( 0 :: nat))
          , ref_rel_idx =(( 0 :: nat))
          , ref_src_scn =(( 0 :: nat))
       |)
    )), maybe_def_bound_to = None
     
  |) )"


definition def_rec0  :: " symbol_definition "  where 
     " def_rec0 = ( 
   (| def_symname = (''test'')
    , def_syment =    ((| elf64_st_name  = (Elf_Types_Local.uint32_of_nat(( 0 :: nat)))
                       , elf64_st_info  = (Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)))
                       , elf64_st_other = (Elf_Types_Local.unsigned_char_of_nat(( 0 :: nat)))
                       , elf64_st_shndx = (Elf_Types_Local.uint16_of_nat shn_undef)
                       , elf64_st_value = (Elf_Types_Local.uint64_of_nat(( 0 :: nat)))
                       , elf64_st_size  = (of_int (int (( 0 :: nat))))
                       |))
    , def_sym_scn =(( 0 :: nat))
    , def_sym_idx =(( 1 :: nat))
    , def_linkable_idx =(( 0 :: nat))
    |) )"


(*val meta : list ((maybe element_range) * elf_range_tag)*)
definition meta0  :: "nat \<Rightarrow> ((string*(nat*nat))option*(any_abi_feature)range_tag)list "  where 
     " meta0 offset = ( [
        (Some ((''.text''), (( 1 :: nat),( 4 :: nat))), SymbolRef(ref_and_reloc_rec0))
    ,   (Some ((''.data''), (( offset :: nat),( 8 :: nat))), SymbolDef(def_rec0))
])"



definition img1  :: "nat \<Rightarrow> nat \<Rightarrow> (Elf_Types_Local.byte)list \<Rightarrow>(any_abi_feature)annotated_memory_image "  where 
     " img1 addr data_size instr_bytes = ( 
    (let initial_img =     
 ((|
        elements = (Map.map_of (List.rev [((''.text''), (|
             startpos = (Some(( 4194304 :: nat)))
           , length1 = (Some(( 16 :: nat)))
           , contents = (List.map (\<lambda> x .  Some x) instr_bytes)
          |)),
          ((''.data''), (|
             startpos = (Some(( 4194320 :: nat)))
           , length1 = (Some data_size)
           , contents = (List.map (\<lambda> x .  Some x) (List.replicate data_size ((of_nat (( 42 :: nat)) :: byte))))
          |))
          ]))
        , by_range = (List.set (meta0 (addr - 4194316)))
        , by_tag = (by_tag_from_by_range (List.set (meta0 (addr - 4194316))))
     |)) 
    in 
    (let ref_input_item
     = ((''test.o''), Reloc(Sequence([])), ((File(Filename((''blah'')), Command_line.null_input_file_options)), [InCommandLine(( 0 :: nat))]))
    in 
    (let ref_linkable_item = (RelocELF(initial_img), ref_input_item, Input_list.null_input_options)
    in
    (let bindings_by_name = (Map.map_of (List.rev [
        ((''test''), [(( 0 :: nat), ((( 0 :: nat), ref_rec0, ref_linkable_item), Some(( 0 :: nat), def_rec0, ref_linkable_item)))])
    ]))
    in
    relocate_output_image Abis.sysv_amd64_std_abi bindings_by_name initial_img)))))"


(*
definition compute_relocated_bytes0  :: " unit \<Rightarrow> unit "  where 
     " compute_relocated_bytes0 _ = (
  (let res =    
((let relocatable_program =      
(List.map (\<lambda> m. (of_nat m :: byte)) [( 72 :: nat),( 199 :: nat),( 4 :: nat),( 37 :: nat),( 0 :: nat),( 0 :: nat),( 0 :: nat),( 0 :: nat),( 5 :: nat),( 0 :: nat),( 0 :: nat),( 0 :: nat),( 72 :: nat),( 139 :: nat),( 4 :: nat),( 37 :: nat),( 0 :: nat),( 0 :: nat),( 0 :: nat),( 0 :: nat)])
    in
      (let ef = (elf64_file_of_elf_memory_image sysv_amd64_std_abi id0 (''at_least_some_relocations_relocate.out'') (img1 relocatable_program)) in
      get_elf64_executable_image ef >>= (\<lambda> (segs_and_provenance, entry, mach) . 
        if mach = elf_ma_x86_64 then
          (let filtered = (List.filter (\<lambda> x . (elf64_segment_type   x) = elf_pt_load) (List.map (\<lambda> (x, y) .  x) segs_and_provenance)) in
          (let filtered = (List.map Byte_sequence.byte_list_of_byte_sequence (List.map (\<lambda> x . (elf64_segment_body   x)) filtered)) in
          (let _ = (List.map (\<lambda> x .  ()) filtered) in
            error_return () )))
        else
          failwith (''wrong machine type returned'')))))
  in (case  res of
      Success s => ()
    | Fail e => ()
  )))"
*)

end
