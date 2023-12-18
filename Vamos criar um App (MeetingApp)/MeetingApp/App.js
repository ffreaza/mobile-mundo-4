// App.js
import React, { useState } from 'react';
import { StyleSheet, View, ScrollView } from 'react-native';
import { StatusBar } from 'expo-status-bar';
import CadastroFornecedor from './CadastroFornecedor';
import ListaFornecedores from './ListaFornecedores';

// Componente principal do aplicativo
export default function App() {
  // Estado para armazenar a lista de fornecedores
  const [fornecedores, setFornecedores] = useState([]);

  // Função para lidar com o envio de novos fornecedores do componente de cadastro
  const handleCadastroSubmit = (novoFornecedor) => {
    // Atualiza o estado com o novo fornecedor
    setFornecedores([...fornecedores, novoFornecedor]);
  };

  // Componente principal que renderiza a interface do aplicativo
  return (
    <ScrollView contentContainerStyle={styles.scrollContainer}>
      <View style={styles.container}>
        {/* Componente de CadastroFornecedor com propriedade de callback de envio */}
        <CadastroFornecedor onCadastroSubmit={handleCadastroSubmit} />
        
        {/* Componente ListaFornecedores exibindo a lista atualizada de fornecedores */}
        <ListaFornecedores fornecedores={fornecedores} />
        
        {/* Barra de status do aplicativo */}
        <StatusBar style="auto" />
      </View>
    </ScrollView>
  );
}

// Estilos para o componente App
const styles = StyleSheet.create({
  scrollContainer: {
    flexGrow: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
});
