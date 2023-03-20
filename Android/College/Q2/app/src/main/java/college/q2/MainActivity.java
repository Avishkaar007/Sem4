package college.q2;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.service.autofill.OnClickAction;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {
    TextView tv;
    Button inc,dec,rt;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tv=(TextView) findViewById(R.id.textView);
        inc=(Button) findViewById((R.id.increment));
        dec=(Button) findViewById(R.id.decrement);
        rt=(Button) findViewById((R.id.reset));



        rt.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String str= tv.getText().toString();
                int count=Integer.parseInt(str);
                count=0;
                tv.setText(String.valueOf(count));
            }
        });
    }

    public void IncFunc(View view){
        String str= tv.getText().toString();
        int count=Integer.parseInt(str);
        count+=1;
        tv.setText(String.valueOf(count));
    }

    public void DecFunc(View view){
        String str= tv.getText().toString();
        int count=Integer.parseInt(str);
        count-=1;
        tv.setText(String.valueOf(count));
    }

}