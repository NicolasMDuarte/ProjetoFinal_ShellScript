opcao_inicial=0
while test "$opcao_inicial" -ne 3
do
	echo "Opções: (1)Usuário (2)Permissões de Acesso (3)Terminar Programa"
	read opcao_inicial
	if test "$opcao_inicial" -eq 1
	then
		echo "(1)Criar Usuário com Senha (2)Excluir Usuário"
		read opcao_secundaria
		if test "$opcao_secundaria" -eq 1
		then
			{
				echo "Digite o nome do usuário novo, aperte [Enter] e digite uma senha, aperte [Enter] de novo e repita a senha: "
				read nome_usuario
				sudo adduser "$nome_usuario" 2> /dev/null
			} || {
				echo "Digite um nome válido, sem letras maiúsculas ou caracteres especiais!"
			}
		fi
		if test "$opcao_secundaria" -eq 2
		then
			{
				echo "Digite o nome do usuário a ser excluído: "
				read nome_usuario
				sudo deluser "$nome_usuario" 2> /dev/null
			} || {
				echo "Erro. Digite um usuário válido!"
			}
		fi
	fi
	if test "$opcao_inicial" -eq 2
	then
		echo "(1)Modificar o dono de um arquivo ou diretório (2)Modificar o grupo dono de um arquivo ou diretório (3)Modificar as permissões de um arquivo ou diretório"
		read opcao_secundaria
		if test "$opcao_secundaria" -eq 1
		then
			echo "Digite o nome do novo dono: "
			read novo_dono
			echo "Agora, digite o caminho para o arquivo ou diretório: "
			read arquivo
			sudo chown "$novo_dono" "$arquivo"
			echo "Fim de execução."
		fi
		if test "$opcao_secundaria" -eq 2
		then
			echo "Digite o nome do novo grupo dono: "
			read novo_grupo
			echo "Agora, digite o caminho para o arquivo ou diretório: "
			read arquivo
			sudo chown :"$novo_grupo" "$arquivo"
			echo "Fim de execução."
		fi
		if test "$opcao_secundaria" -eq 3
		then
			echo "Digite o caminho para o arquivo ou diretório: "
			read arquivo
			echo "Permissões de quem: (u)Usuário (g)Grupo (o)Outros"
			read perm
			echo "Permissão desejada: (1)Nenhuma (2)Escrita (3)Leitura (4)Escrita e leitura (5)Adicionar Execução (6)Remover Execução"
			read opcao_terciaria
			if test "$opcao_terciaria" -eq 1
			then
				sudo chmod "$perm"= "$arquivo"
				echo "Fim de execução."
			fi
			if test "$opcao_terciaria" -eq 2
			then
				sudo chmod "$perm"=w "$arquivo"
				echo "Fim de execução."
			fi
			if test "$opcao_terciaria" -eq 3
			then
				sudo chmod "$perm"=r "$arquivo"
				echo "Fim de execução."
			fi
			if test "$opcao_terciaria" -eq 4
			then
				sudo chmod "$perm"=rw "$arquivo"
				echo "Fim de execução."
			fi
			if test "$opcao_terciaria" -eq 5
			then
				sudo chmod "$perm"+x "$arquivo"
				echo "Fim de execução."
			fi
			if test "$opcao_terciaria" -eq 6
			then
				sudo chmod "$perm"-x "$arquivo"
				echo "Fim de execução."
			else
				echo "Digite uma opção válida!"
			fi
		else
			echo "Digite uma opção válida!"
		fi
	else
		if test "$opcao_inicial" -ne 3
		then
			echo "Digite uma opção válida!"
		fi
	fi
done
