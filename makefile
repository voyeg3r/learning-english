# Arquivo: <+Description+>
# Criado: Seg 24/Dez/2012 hs 18:40
# Last Change: 2013 Feb 05 07:48:38 PM
# Based on http://wikiri.upc.es/index.php/A_Makefile_to_compile_Latex
# by: Joenio Costa <joenio@perl.org.br>
#
# sempre coloco esses dois aliases no meu ~/.bashrc para facilitar as  coisas
#
# alias compilalivro='make clean; make && make show'
# alias updatelivro='hg push ssh://hg@bitbucket.org/sergio/learn-english'
#
# lembre-se que você tem que exportar sua chave pública do ssh para o
# bitbucket além de criar o ~/hgrc (com um conteúdo desse tipo)
#
#    [ui]
#    ssh = ssh -i ~/.ssh/id_rsa.pub -C
#    username = sergio silva <voyeg3r@gmail.com>
#    editor = vim
#    [paths]
#    default = ssh://hg@bitbucket.org/sergio/vimfiles
#
#
############################### FILES ###############################
#
# DOC: the document
#
# para fazer tudo de uma vez:
# make clean; make && make show

DOC = como-aprender-ingles

############################### PROGRAMS ###############################

TEX = pdflatex
RM = rm -f
MAKE = make
PDFVIEW = evince

########################################################################

$(DOC).pdf:
	$(TEX) $(DOC).tex
	#bibtex $(DOC).aux
	$(TEX) $(DOC).tex
	makeindex $(DOC).idx
	$(TEX) $(DOC).tex

clean:
	@$(RM) $(DOC).aux $(DOC).log
	@$(RM) $(DOC).toc $(DOC).lot $(DOC).lof
	@$(RM) $(DOC).ttt $(DOC).lot $(DOC).fff
	@$(RM) $(DOC).blg $(DOC).out
	@$(RM) $(DOC).dvi $(DOC)-*.dvi
	@$(RM) $(DOC).ps $(DOC)-*.ps
	@$(RM) $(DOC).tex.backup
	@$(RM) $(DOC).tex.bak
	@$(RM) $(DOC).bbl
	@$(RM) $(DOC).pdf
	@$(RM) $(DOC).tex~
	@$(RM) $(DOC).bib~
	@$(RM) Makefile~
	@$(RM) *.ind *.ilg *.idx *.aux
	@$(RM) texput.log core

#show:   $(DOC).pdf
#	evince $(DOC).pdf &

show:   $(DOC).pdf
	$(PDFVIEW) $(DOC).pdf &

#shownew:	clean	$(DOC).pdf
#	evince $(DOC).pdf
