import com.google.android.gms.wearable.MessageEvent;
import com.google.android.gms.wearable.WearableListenerService;
import java.nio.charset.StandardCharsets;

public class DataListenerService extends WearableListenerService {

    @Override
    public void onMessageReceived(MessageEvent messageEvent) {
        if (messageEvent.getPath().equals("/dados_coletados")) {
            String dados = new String(messageEvent.getData(), StandardCharsets.UTF_8);
            exibirDadosNaTela(dados);
        } else {
            super.onMessageReceived(messageEvent);
        }
    }

    private void exibirDadosNaTela(String dados) {
        DisplayDataActivity activity = new DisplayDataActivity();
        activity.exibirDados(dados);
    }
}
