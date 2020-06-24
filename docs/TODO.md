# TODO

- Create a LaTeX way to generate PDF-A format
    - Class parameter to define PDF-A category (e.g., PDF/A-2B)

- Configure a CI tool (e.g., Travis.CI)
    - Automatically build and check for errors and warnings the `utfprct.tex`
    - Update the generated PDF example file (`utfprct.pdf`)
    - Update the modified date and author of the files
    - Create and maintain changelog file
    - Automatically publish new version to the Overleaf template

- Change `make.bat` and `makefile` to accept filename (source) as parameter and `utfprct.tex` if not defined

- Include the possibility of "Coletânea de Artigos" to the template

- Aumentar abrangêngia da NBR6023/2018 (referências)
    - Melhorar comando @patent (bibtex) do abnTeX2 (está implementado de forma incorreta)
    - Implementar formatos faltantes
    - Inserir exemplos dos formatos ainda não contemplados

# BUGS

- Bug0001:
    - Given: that there are at least one annex and one appendix and the annex initial page is removed (`\partanexos`)
    - Then: then the first annex is referred as `appendix` in the table of contents (toc). The next annexes are okay.
    - Issue: https://github.com/abntex/abntex2/issues/224 (abntex2)
    - Reasoning: the abntex2 and the memoir class are having problems to handle this condition in the toc file. When we add a new page (empty paragraph*, or even a letter...) between the last appendix and the first annex, then the latex is able to solve the toc correctly. For now, I recommend to maintian the `\partanexos` and `\partapendices` (just to maintain the pattern) to avoid such problem.
