#!/bin/bash -
#
# %FFILE%
# Copyright (C) %YEAR% %USER% <%MAIL%>
#

elog(){ echo "$@" 1>&2 ; }

if [ $# -eq 0 ]; then
  elog "Usage: $0 " 
  exit 1
fi 

%HERE%
