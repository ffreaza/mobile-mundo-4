import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

public class MainActivity extends Activity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Você pode adicionar aqui o código para iniciar o serviço DataListenerService
        // Exemplo: startService(new Intent(this, DataListenerService.class));

        Button buttonIniciarServico = findViewById(R.id.buttonIniciarServico);
        buttonIniciarServico.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Inicie o serviço DataListenerService
                startService(new Intent(MainActivity.this, DataListenerService.class));
            }
        });
    }
}
