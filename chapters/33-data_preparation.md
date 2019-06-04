# data 
so we got all the data from open corpus and downloaded them in multiple files

you can use the `/data/get_corpora.sh` on the details.
basically we download everything we can in tmx and moses format
unpack them and delete everything that is to small

## eurocombo
### origin
\TODO{Add new corpora once we use them}
we work on the following files:
- ECB
- EMEA
- Europarl

and we get the following langauges
- de
- en
- cs

Basically we need only the moses stuff but in the script we get the tmx as well, because I thought we could use that.
\TODO{remove the uneeded stuff}

We combine the above ones with the same ratio to get one big one

### preparation
