## tex_out by Jonathan Shea
## This software is released by the author to the public domain
## For more information see http://jonshea.com/copyright.html

## tex_out writes a matrix to a file that can be included in a .tex file

## tex_out takes a matrix, var, and a string, name, and outputs the matrix
## to a texfile "name.tex" which is suitable to include in a LaTeX file with
## the command \input{name.tex}, in the math environment.

## By default the array entries are formated to 4 digits, and wrapped in 
## \mathtt{} to result in typewritter font. This may be overridable in the
## future.

## Example:
## tex_out(magic(3), "magic")
## Results in a file in the current directory, "magic.tex" whose contents are:
## \begin{array}{ccc}
## \mathtt{8.000} & \mathtt{1.000} & \mathtt{6.000} \\ 
## \mathtt{3.000} & \mathtt{5.000} & \mathtt{7.000} \\ 
## \mathtt{4.000} & \mathtt{9.000} & \mathtt{2.000} \\ 
## \end{array}

##

function tex_out(var, name)
  if(nargin != 2)
    usage("tex_out(matrix, filename)")
  end
  if(size(size(var)) > 2)
    error("tex_out doesn't know how to format matrixes with more than 2 dimensions. size(var) is %i", size(var))
  endif

  [rows, columns] = size(var);
  fid = fopen(strcat(name, ".tex"), "wt", "native");

  ## Write the LaTeX array header
  fprintf(fid, "\\begin{array}{");
  for i = 1:columns
    fprintf(fid, "c");
  endfor
  fprintf(fid, "}\n");

  ## Build a format string that will 
  fmt = fmt0 = "\\mathtt{%#0.4g} ";
  if (columns > 1)
    for i = 2:columns
      fmt = strcat(fmt, "& ", fmt0);
    endfor
  endif
  fmt = strcat(fmt, "\\\\ \n");
  fprintf(fid, fmt, var.'); # Note that var gets transposed
  fprintf(fid, "\\end{array}");
  fclose(fid);
endfunction
