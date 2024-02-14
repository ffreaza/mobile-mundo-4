import com.google.android.gms.wearable.MessageEvent;
import com.google.android.gms.wearable.WearableListenerService;
import java.nio.charset.StandardCharsets;

public class DataListenerService extends WearableListenerService {

    @Override
    public void onMessageReceived(MessageEvent messageEvent) {
        if (messageEvent.getPath().equals("/dados_coletados")) {
            String dados = new String(messageEvent.getData(), StandardCharsets.UTF_8);
            // Chamar o método exibirDados() no MainActivity para mostrar os dados
            MainActivity mainActivity = new MainActivity();
            mainActivity.exibirDados(dados);
        } else {
            super.onMessageReceived(messageEvent);
        }
    }
}
