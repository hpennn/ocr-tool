package cn.zhinenti.app;

import android.os.Bundle;
import com.getcapacitor.BridgeActivity;
import android.content.Intent;
import android.net.Uri;
import com.getcapacitor.Bridge;
import com.getcapacitor.CapConfig;

public class MainActivity extends BridgeActivity {
    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        // 外部链接使用系统浏览器打开
        registerPlugin(cn.zhinenti.app.ExternalLinkPlugin.class);
    }
}
