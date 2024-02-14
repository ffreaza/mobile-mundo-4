import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

public class MainActivity extends Activity {

    private TextView textViewDados;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textViewDados = findViewById(R.id.textViewDados);

        // Iniciar o serviço de escuta de dados
        startService(new Intent(this, DataListenerService.class));
    }

    // Método para exibir os dados recebidos
    public void exibirDados(String dados) {
        textViewDados.setText(dados);
    }
}
