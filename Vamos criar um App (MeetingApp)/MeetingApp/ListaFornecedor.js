// ListaFornecedores.js
import React, { useState } from 'react';
import { View, Text, TextInput, Image } from 'react-native';

const ListaFornecedores = ({ fornecedores }) => {
  // Estados para armazenar os filtros de categoria e localização
  const [categoriaFiltro, setCategoriaFiltro] = useState('');
  const [localizacaoFiltro, setLocalizacaoFiltro] = useState('');

  // Filtra os fornecedores com base nos filtros atuais
  const fornecedoresFiltrados = fornecedores.filter((fornecedor) => {
    // Verifica se a categoria do fornecedor corresponde ao filtro
    const categoriaMatch =
      categoriaFiltro === '' || fornecedor.categorias.includes(categoriaFiltro);

    // Verifica se a localização do fornecedor corresponde ao filtro (case-insensitive)
    const localizacaoMatch =
      localizacaoFiltro === '' ||
      fornecedor.localizacao.toLowerCase().includes(localizacaoFiltro.toLowerCase());

    // Retorna verdadeiro apenas se ambas as condições forem atendidas
    return categoriaMatch && localizacaoMatch;
  });

  // Componente de lista de fornecedores
  return (
    <View style={{ margin: 20 }}>
      <Text style={{ fontSize: 20, marginBottom: 10 }}>Lista de Fornecedores</Text>

      {/* Campo de entrada para filtrar por categoria */}
      <TextInput
        style={styles.input}
        placeholder="Filtrar por Categoria"
        value={categoriaFiltro}
        onChangeText={(text) => setCategoriaFiltro(text)}
      />

      {/* Mapeia e exibe os fornecedores filtrados */}
      {fornecedoresFiltrados.map((fornecedor, index) => (
        <View key={index} style={styles.fornecedorContainer}>
          <Text style={styles.nomeFornecedor}>Nome: {fornecedor.nome}</Text>
          <Text>Endereço: {fornecedor.endereco}</Text>
          <Text>Contato: {fornecedor.contato}</Text>
          <Text>Categorias de Produtos: {fornecedor.categorias}</Text>

          {/* Exibe a imagem do fornecedor, se existir */}
          {fornecedor.imagem && (
            <Image
              source={{ uri: fornecedor.imagem }}
              style={styles.imagemFornecedor}
            />
          )}
        </View>
      ))}
    </View>
  );
};

// Estilos para o componente ListaFornecedores
const styles = {
  input: {
    fontSize: 16,
    marginBottom: 10,
    padding: 10,
    borderWidth: 1,
    borderRadius: 5,
  },
  fornecedorContainer: {
    marginBottom: 20,
  },
  nomeFornecedor: {
    fontSize: 18,
    fontWeight: 'bold',
  },
  imagemFornecedor: {
    width: 100,
    height: 100,
    marginTop: 10,
  },
};

export default ListaFornecedores;
