## tex2sym by Jonathan Shea
## This software is released by the author to the public domain
## For more information see http://jonshea.com/copyright.html

## tex2sym attempts to translate a string with tex like syntax into
## a string that gnuplot will print in the intended way.

## Example:
## octave:1> tex2sym('\nabla \cdot E = \rho / \epsilon_0')
## ans = {/Symbol \321} {/Symbol \327} E = {/Symbol r} / {/Symbol e}_0


function symstring = tex2sym(texstring, varargin)
  if(nargin = 0)
    usage("tex2sym('string to convert from \\LaTeX')")
  end
##  symstring = sprintf(texstring, all_va_args);
  symstring = sprintf(texstring);

  key = [struct("tex", "\\alpha","sym", "{/Symbol a}");
	 struct("tex", "\\beta","sym", "{/Symbol b}");
	 struct("tex", "\\gamma","sym", "{/Symbol g}");
	 struct("tex", "\\Gamma","sym", "{/Symbol G}");
	 struct("tex", "\\delta","sym", "{/Symbol d}");
	 struct("tex", "\\Delta","sym", "{/Symbol D}");
	 struct("tex", "\\epsilon","sym", "{/Symbol e}");
#	 struct("tex", "\\varepsilon","sym", "{/Symbol \\220}");
	 struct("tex", "\\zeta","sym", "{/Symbol z}");
	 struct("tex", "\\eta","sym", "{/Symbol h}");
	 struct("tex", "\\theta","sym", "{/Symbol q}");
	 struct("tex", "\\Theta","sym", "{/Symbol Q}");
	 struct("tex", "\\vartheta","sym", "{/Symbol J}");
	 struct("tex", "\\iota","sym", "{/Symbol i}");
	 struct("tex", "\\kappa","sym", "{/Symbol k}");
	 struct("tex", "\\lambda","sym", "{/Symbol l}");
	 struct("tex", "\\Lambda","sym", "{/Symbol L}");
	 struct("tex", "\\mu" ,"sym", "{/Symbol m}");
	 struct("tex", "\\nu","sym", "{/Symbol n}");
	 struct("tex", "\\xi","sym", "{/Symbol x}");
	 struct("tex", "\\Xi","sym", "{/Symbol X}");
	 struct("tex", "\\pi","sym", "{/Symbol p}");
	 struct("tex", "\\Pi","sym", "{/Symbol P}");
	 struct("tex", "\\varpi","sym", "{/Symbol v}");
	 struct("tex", "\\rho","sym", "{/Symbol r}");
#	 struct("tex", "\\varrho","sym", "{/Symbol \\220}");
	 struct("tex", "\\sigma","sym", "{/Symbol s}");
	 struct("tex", "\\Sigma","sym", "{/Symbol S}");
	 struct("tex", "\\varsigma","sym", "{/Symbol V}");
	 struct("tex", "\\tau","sym", "{/Symbol t}");
	 struct("tex", "\\upsilon","sym", "{/Symbol u}");
	 struct("tex", "\\Upsilon","sym", "{/Symbol U}");
	 struct("tex", "\\phi","sym", "{/Symbol f}");
	 struct("tex", "\\Phi","sym", "{/Symbol F}");
#	 struct("tex", "\\varphi","sym", "{/Symbol \\220}");
	 struct("tex", "\\chi","sym", "{/Symbol c}");
	 struct("tex", "\\psi","sym", "{/Symbol y}");
	 struct("tex", "\\Psi","sym", "{/Symbol Y}");
	 struct("tex", "\\omega","sym", "{/Symbol w}");
	 struct("tex", "\\Omega","sym", "{/Symbol W}");
	 struct("tex", "\\times","sym", "{/Symbol .}");
	 struct("tex", "\\pm","sym", "{/Symbol -}");
	 struct("tex", "\\partial","sym", "{/Symbol \\266}");
	 struct("tex", "\\Real","sym", "{/Symbol `}");
	 struct("tex", "\\Imag","sym", "{/Symbol '}");
	 struct("tex", "\\infty","sym", "{/Symbol \\245}");
	 struct("tex", "\\nabla","sym", "{/Symbol \\321}");
	 struct("tex", "\\int","sym", "{/Symbol \\362}");
	 struct("tex", "\\sum","sym", "{/Symbol \\345}");
	 struct("tex", "\\propto","sym", "{/Symbol \\265}");
	 struct("tex", "\\approx","sym", "{/Symbol \\173}");
	 struct("tex", "\\sim","sym", "{/Symbol ~}");
	 struct("tex", "\\cong","sym", "{/Symbol \\100}");
	 struct("tex", "\\perp","sym", "{/Symbol \\136}");
	 struct("tex", "\\dots","sym", "{/Symbol \\274}");
	 struct("tex", "\\neq","sym", "{/Symbol \\271}");
	 struct("tex", "|","sym", "{/Symbol \\275}");
	 struct("tex", "\\cdot","sym", "{/Symbol \\327}");
         struct("tex", "\\sqrt","sym", "{/Symbol \\326}");
         struct("tex", "|","sym", "{/Symbol \\275}");
	 struct("tex", "\\to","sym", "{/Symbol \\256}");
	 struct("tex", "\\ge","sym", "{/Symbol \\263}");
	 struct("tex", "\\le","sym", "{/Symbol \\243}")];
# 	 struct("tex", ,"sym", );

  n = size(key);
  for i = 1:n
    symstring = strrep(symstring, key(i).tex, key(i).sym);
  endfor
endfunction
