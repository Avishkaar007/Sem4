package com.example.alertbox;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;

public class MainActivity extends AppCompatActivity {
    Button bt1;
    EditText et1,et2;
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        et1=findViewById(R.id.editTextTextEmailAddress);
        et2=findViewById(R.id.editTextTextPassword);
        bt1=findViewById(R.id.button);

        bt1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                String email=et1.getText().toString();
                String pass=et2.getText().toString();

                if(email.equals("Pranav") & pass.equals("admin")){
                    Intent im=new Intent(MainActivity.this, Login.class);
                    startActivity(im);
                }
            }
        });
    }
}