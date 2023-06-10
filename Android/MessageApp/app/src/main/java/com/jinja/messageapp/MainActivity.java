package com.jinja.messageapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import  android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.send_layout);
    }
    public void onSendMessage(View view){
        Button button1=(Button) findViewById(R.id.sendButton);
        EditText et=(EditText)findViewById(R.id.EditText1);
        String string =et.getText().toString();
        Intent intent =new Intent(this,Receive.class);
        intent.putExtra("message",string);
        startActivity(intent);
    }
}
