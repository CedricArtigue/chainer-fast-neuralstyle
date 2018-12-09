.PHONY: all

# %:
# 	python generate.py img/$@ -m ../chainer-fast-neuralstyle-models/models/starrynight.model -o img/$@_starrynight.jpg
# 	python generate.py img/$@ -m ../chainer-fast-neuralstyle-models/models/fur_0.model -o img/$@_fur.jpg

SIZE=medium
#WORD:=$(shell python test_speech.py 2> /dev/null | sed -e 's/ /_/g')

# %:
# 	@googleimagesdownload -k $@ -s $(SIZE) -f jpg -l 1
# 	@for file in downloads/$@/* ; do mv -v -- "$$file" ./build/$@.jpg ; break ; done
# 	@python generate.py build/$@.jpg -m ../chainer-fast-neuralstyle-models/models/kanagawa.model -o build/$@_kanagawa.jpg
# 	@open build/$@_kanagawa.jpg

# test:
# 	echo $(WORD)

# %:
# 	@googleimagesdownload -k $@ -s $(SIZE) -f jpg -l 1 -r labeled-for-reuse-with-modifications
# 	@for file in downloads/$@/* ; do mv -v -- "$$file" ./build/$@.jpg ; break ; done
# 	@python generate.py build/$@.jpg -m ../chainer-fast-neuralstyle-models/models/kandinsky_e2_full512.model -o build/$@_kandinsnky.jpg
# 	@open build/$@_kandinsnky.jpg

# %:
# 	@googleimagesdownload -k $@ -s $(SIZE) -f jpg -l 1
# 	@for file in downloads/$@/* ; do mv -v -- "$$file" ./build/$@.jpg ; break ; done
# 	@python generate.py build/$@.jpg -m ../chainer-fast-neuralstyle-models/models/starrynight.model -o build/$@_starrynight.jpg
# 	@open build/$@_starrynight.jpg

kandinsky:
	@$(eval QUERY=$(shell python test_speech.py 2> /dev/null))
	@$(eval WORD=test)
	@echo "You said: $(QUERY)"
	@googleimagesdownload -k "$(QUERY)" -s $(SIZE) -f jpg -l 1 -r labeled-for-reuse-with-modifications
	@for file in downloads/$(QUERY)/* ; do mv -v -- "$$file" ./build/$(WORD).jpg ; break ; done
	@python generate.py build/$(WORD).jpg -m ../chainer-fast-neuralstyle-models/models/kandinsky_e2_full512.model -o build/$(WORD)_kandinsky.jpg
	@open build/$(WORD)_kandinsky.jpg

# %:
# 	@echo "You said: $(WORD)"
# 	@googleimagesdownload -k $(WORD) -s $(SIZE) -f jpg -l 1 -r labeled-for-reuse-with-modifications
# 	@for file in downloads/$(WORD)/* ; do mv -v -- "$$file" ./build/$(WORD).jpg ; break ; done
# 	@python generate.py build/$(WORD).jpg -m ../chainer-fast-neuralstyle-models/models/kandinsky_e2_full512.model -o build/$(WORD)_kandinsnky.jpg
# 	@open build/$(WORD)_kandinsnky.jpg



# Stack is googleimagesdownload, chainer-fast-neuralstyle and SpeechRecognition
# Il faut utiliser la chaine de caractère directement 