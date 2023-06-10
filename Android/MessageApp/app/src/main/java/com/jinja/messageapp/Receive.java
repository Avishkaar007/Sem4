package com.jinja.messageapp;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.TextView;

public class Receive extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.receiver_layout);
        TextView tv=(TextView) findViewById(R.id.textView1);
        Intent intent=getIntent();
        String string = intent.getStringExtra("message");

        tv.setText(string);

    }

}