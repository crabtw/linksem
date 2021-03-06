(* Generated by Lem from abis/aarch64/abi_aarch64_symbol_table.lem. *)

Require Import Arith.
Require Import Bool.
Require Import List.
Require Import String.
Require Import Program.Wf.

Require Import coqharness.

Open Scope nat_scope.
Open Scope string_scope.

(** [abi_aarch64_symbol_table], symbol table specific defintions for the AARCH64
  * ABI.
  *)

Require Import lem_basic_classes.
Require Export lem_basic_classes.

Require Import lem_bool.
Require Export lem_bool.


Require Import elf_header.
Require Export elf_header.

Require Import elf_symbol_table.
Require Export elf_symbol_table.

Require Import elf_section_header_table.
Require Export elf_section_header_table.

Require Import elf_types_native_uint.
Require Export elf_types_native_uint.

(* [?]: removed value specification. *)

Definition is_aarch64_weak_reference  (ent : elf64_symbol_table_entry )  : bool :=  beq_nat  
(nat_of_elf64_half(elf64_st_shndx ent)) shn_undef && beq_nat    
(get_elf64_symbol_binding ent) stb_weak.
(* [?]: removed value specification. *)

Definition is_aarch64_weak_definition  (ent : elf64_symbol_table_entry )  : bool :=  negb (beq_nat (nat_of_elf64_half(elf64_st_shndx ent)) shn_undef) && beq_nat    
(get_elf64_symbol_binding ent) stb_weak.
