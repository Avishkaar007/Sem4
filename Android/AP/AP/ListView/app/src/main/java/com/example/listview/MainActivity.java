package com.example.listview;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.ListView;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    ListView l1;
    String[] courses={"CS", "Maths", "Physics", "Chemistry", "Biology"};
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        l1=findViewById(R.id.list_view);
        ArrayAdapter adapter=new ArrayAdapter(MainActivity.this, android.R.layout.simple_list_item_1, courses);
        l1.setAdapter(adapter);

        l1.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> parent, View view, int pos, long id) {
                    if(pos == 0){
                        Toast.makeText(MainActivity.this, "CS", Toast.LENGTH_SHORT).show();
                    }
                    else if(pos ==1 ){
                        Toast.makeText(MainActivity.this, "Maths", Toast.LENGTH_SHORT).show();
                    }
                    else if(pos ==2 ){
                        Toast.makeText(MainActivity.this, "Physics", Toast.LENGTH_SHORT).show();
                    }
                    else if(pos ==3 ){
                        Toast.makeText(MainActivity.this, "Chemistry", Toast.LENGTH_SHORT).show();
                    }
                    else{
                        Toast.makeText(MainActivity.this, "Biology", Toast.LENGTH_SHORT).show();
                    }
            }
        });
    }
}