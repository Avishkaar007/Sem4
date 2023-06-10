package com.example.fragments;

import android.content.Context;
import android.os.Bundle;

import androidx.fragment.app.Fragment;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Toast;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

public class Fragment1 extends Fragment {

    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View v= inflater.inflate(R.layout.fragment_1, container, false);
        Log.e("FLC","OnCreateView");
        return v;
    }

    public void onAttach(@NotNull Context context){
        super.onAttach(context);
        Toast t=Toast.makeText(getActivity(),"on Attach",Toast.LENGTH_SHORT);
        t.show();
        Log.e("FLC","OnAttach");
    }

    public void onDetach(){
        super.onDetach();
        Toast t=Toast.makeText(getActivity(),"on Detach",Toast.LENGTH_SHORT);
        t.show();
        Log.e("FLC","OnDetach");
    }

    public void onStart(){
        super.onStart();
        Toast t=Toast.makeText(getActivity(),"on Start",Toast.LENGTH_SHORT);
        t.show();
        Log.e("FLC","OnStart");
    }

    public void onResume(){
        super.onResume();
        Toast t=Toast.makeText(getActivity(),"on Start",Toast.LENGTH_SHORT);
        t.show();
        Log.e("FLC","OnStart");
    }

    public void onPause(){
        super.onPause();
        Toast t=Toast.makeText(getActivity(),"on Pause",Toast.LENGTH_SHORT);
        t.show();
        Log.e("FLC","OnPause");
    }

    public void onDestroy(){
        super.onDestroy();
        Toast t=Toast.makeText(getActivity(),"on Destroy",Toast.LENGTH_SHORT);
        t.show();
        Log.e("FLC","OnDestroy");
    }

    public void onStop(){
        super.onStop();
        Toast t=Toast.makeText(getActivity(),"on Stop",Toast.LENGTH_SHORT);
        t.show();
        Log.e("FLC","OnStop");
    }

    public void onDestroyView(){
        super.onDestroyView();
        Toast t=Toast.makeText(getActivity(),"on Destroy",Toast.LENGTH_SHORT);
        t.show();
        Log.e("FLC","OnDestroy");
    }

    public void onViewCreated(@NotNull View view, @Nullable Bundle savedInstanceState){
        super.onViewCreated(view, savedInstanceState);
        Toast t=Toast.makeText(getActivity(),"on Stop",Toast.LENGTH_SHORT);
        t.show();
        Log.e("FLC","OnStop");
    }
}