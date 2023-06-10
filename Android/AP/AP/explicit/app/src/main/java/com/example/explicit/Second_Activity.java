package com.example.explicit;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

public class Second_Activity extends AppCompatActivity {
    TextView t2;
    TextView t1;
    String ms;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_second);

        t1=findViewById(R.id.textView2);
        t2=findViewById(R.id.textView);

        Intent i=getIntent();
        ms=i.getStringExtra("Message");
        t1.setText(ms);
    }


}