import android.app.Activity;
import android.os.Bundle;
import android.widget.TextView;

public class DisplayDataActivity extends Activity {

    private TextView textViewDados;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_display_data);

        textViewDados = findViewById(R.id.textViewDados);
    }

    public void exibirDados(String dados) {
        textViewDados.setText(dados);
    }
}
