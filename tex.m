## tex_out by Jonathan Shea
## This software is released by the author to the public domain
## For more information see http://jonshea.com/copyright.html

## tex_out takes a matrix, var, and a string, name, and outputs the matrix
## to a texfile "name.tex" which is suitable to include in a LaTeX file with
## the command \input{name.tex}

function tex(var, name)
  if(narin == 1)
    name = var
  endif

  [rows, columns] = size(var);
  fid = fopen(strcat(name, ".tex"), "wt", "native");
  fprintf(fid, "\\begin{array}{");
  for i = 1:columns
    fprintf(fid, "c");
  endfor
  fprintf(fid, "}\n");
  fmt = fmt0 = "\\mathtt{%#0.4g} ";
  if (columns > 1)
    for i = 2:columns
      fmt = strcat(fmt, "& ", fmt0);
    endfor
  endif
  fmt = strcat(fmt, "\\\\ \n");
  fprintf(fid, fmt, var.');
  fprintf(fid, "\\end{array}");
  fclose(fid);
endfunction
