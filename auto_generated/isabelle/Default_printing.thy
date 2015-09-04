chapter {* Generated by Lem from default_printing.lem. *}

theory "Default_printing" 

imports 
 	 Main
	 "/home/pes20/bitbucket/lem/isabelle-lib/Lem_function" 

begin 

(** [default_printing] module is a small utility module providing default
  * printing functions for when ABI-specific functions are not available.
  * These functions were constantly being redefined and reused all over the
  * place hence their placement in this module.
  *)
(*open import Function*)

(** [default_os_specific_print] is a default print function for OS specific
  * functionality.
  *)
(*val default_os_specific_print : forall 'a. 'a -> string*)

(** [default_proc_specific_print] is a default print function for processor specific
  * functionality.
  *)
(*val default_proc_specific_print : forall 'a. 'a -> string*)

(** [default_user_specific_print] is a default print function for user specific
  * functionality.
  *)
(*val default_user_specific_print : forall 'a. 'a -> string*)end
