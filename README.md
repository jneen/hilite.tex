``` tex
\noindent Hello! Here is some highlighted code:

\begin{hilite}[ruby]
# yo this is ruby

Rouge.highlight('LaTeX') # not real syntax lol

puts "completely \" backslash \safe" # \\\\\\\\\
\end{hilite}

\noindent And you can also \hl[ruby]/puts "your highlighted code"/ inline!
The syntax works similarly to \verb|\verb|. While this does depend on the
\hl|-shell-escape| flag (and therefore is not usable on platforms like Overleaf
where shelling out is not an option), we do generate cached TeX files, so that
TeX sources can be distributed without relying on \hl|-shell-escape|.

See \hl|example.tex| for more info, or run \hl|make| in this repository to make the example.
```
