(*****************************************************************************
 * Isabelle-OFMC --- Connecting OFMC and Isabelle/HOL
 *                                                                            
 * config.sml.in --- main configuration file for Isabelle-OFMC
 * This file is part of Isabelle-OFMC.
 *
 * Copyright (c) 2009 Achim D. Brucker, Germany
 *
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *
 *     * Redistributions in binary form must reproduce the above
 *       copyright notice, this list of conditions and the following
 *       disclaimer in the documentation and/or other materials provided
 *       with the distribution.
 *
 *     * Neither the name of the copyright holders nor the names of its
 *       contributors may be used to endorse or promote products derived
 *       from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
 * LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
 * A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
 * LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 * DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
 * THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
 * OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 ******************************************************************************)
(* $Id: config.sml.in 349 2009-01-16 19:17:39Z brucker $ *)



structure config =
struct
     val ofmc_id = "$Id: config.sml.in 349 2009-01-16 19:17:39Z brucker $"     
end;



(** Major version number.
 * 
 * Modify when incompatible changes are made to published interfaces.
 *)
val ofmc_ver_major = 0

(* Minor version number.
 *
 * Modify when new functionality is added or new interfaces are
 * defined, but all changes are backward compatible.
 *)
val ofmc_ver_minor = 0 

(** Patch number.
 *
 * Modify for every released patch.
 *)
val ofmc_ver_micro= 0


(** Version tag: a string describing the version.
 *
 * This tag remains " (dev build)" in the repository so that we can
 * always see from "version()" that the software has been built
 * from the repository rather than a "blessed" distribution.
 *
 * When rolling a tarball, we automatically replace this text with ""
 * for final releases; in prereleases, it becomes " (Alpha)",
 * " (Beta 1)", etc., as appropriate.
 *
 *)
val ofmc_ver_tag = " (dev build: 929:933M)"

