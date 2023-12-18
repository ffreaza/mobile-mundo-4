import React, { useState } from 'react';
import { View, Text, TextInput, Image, Button, Alert } from 'react-native';
import * as ImagePicker from 'expo-image-picker';

// Componente de cadastro de fornecedor
const CadastroFornecedor = ({ onCadastroSubmit }) => {
  // Estados para armazenar os dados do fornecedor
  const [nome, setNome] = useState('');
  const [endereco, setEndereco] = useState('');
  const [contato, setContato] = useState('');
  const [categorias, setCategorias] = useState('');
  const [imagem, setImagem] = useState(null);

  // Função para lidar com o envio do cadastro do fornecedor
  const handleCadastro = () => {
    // Verifica se algum campo obrigatório está em branco
    if (!nome || !endereco || !contato || !categorias) {
      // Exibe um alerta se algum campo obrigatório não estiver preenchido
      Alert.alert('Erro', 'Preencha todos os campos obrigatórios.');
      return;
    }

    // Cria um objeto com os dados do novo fornecedor
    const novoFornecedor = {
      nome,
      endereco,
      contato,
      categorias,
      imagem,
    };

    // Chama a função de callback do componente pai para enviar o novo fornecedor
    onCadastroSubmit(novoFornecedor);

    // Limpa os campos após o cadastro
    setNome('');
    setEndereco('');
    setContato('');
    setCategorias('');
    setImagem(null);
  };

  // Função para escolher uma imagem da galeria
  const pickImage = async () => {
    let result = await ImagePicker.launchImageLibraryAsync({
      mediaTypes: ImagePicker.MediaTypeOptions.Images,
      allowsEditing: true,
      aspect: [4, 3],
      quality: 1,
    });

    // Verifica se a seleção de imagem não foi cancelada
    if (!result.canceled) {
      // Atualiza o estado da imagem com a URI da imagem selecionada
      setImagem(result.assets && result.assets.length > 0 ? result.assets[0].uri : null);
    }
  };

  // Componente de formulário de cadastro
  return (
    <View style={{ margin: 20 }}>
      <Text style={{ fontSize: 20, marginBottom: 10 }}>Cadastro de Fornecedor</Text>
      
      {/* Campos de entrada para dados do fornecedor */}
      <TextInput
        style={styles.input}
        placeholder="Nome"
        value={nome}
        onChangeText={(text) => setNome(text)}
      />

      <TextInput
        style={styles.input}
        placeholder="Endereço"
        value={endereco}
        onChangeText={(text) => setEndereco(text)}
      />

      <TextInput
        style={styles.input}
        placeholder="Contato"
        value={contato}
        onChangeText={(text) => setContato(text)}
      />

      <TextInput
        style={styles.input}
        placeholder="Categorias de Produtos"
        value={categorias}
        onChangeText={(text) => setCategorias(text)}
      />

      {/* Botão para escolher uma imagem */}
      <Button title="Escolher Imagem" onPress={pickImage} />

      {/* Exibe a imagem do fornecedor, se existir */}
      {imagem && <Image source={{ uri: imagem }} style={styles.image} />}

      {/* Botão para cadastrar */}
      <Button title="Cadastrar" onPress={handleCadastro} />
    </View>
  );
};

// Estilos para o componente CadastroFornecedor
const styles = {
  input: {
    fontSize: 16,
    marginBottom: 10,
    padding: 10,
    borderWidth: 1,
    borderRadius: 5,
  },
  image: {
    width: 150,
    height: 150,
    marginTop: 10,
  },
};

export default CadastroFornecedor;
