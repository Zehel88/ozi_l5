function varargout = l5_MAIN(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @l5_MAIN_OpeningFcn, ...
                   'gui_OutputFcn',  @l5_MAIN_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function l5_MAIN_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);
format compact


function varargout = l5_MAIN_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function eP_Callback(hObject, eventdata, handles)

function eP_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eQ_Callback(hObject, eventdata, handles)

function eQ_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function pushbutton1_Callback(hObject, eventdata, handles)
clc
P=str2double(get(handles.eP,'String'));
Q=str2double(get(handles.eQ,'String'));
% Модуль
N=P*Q;
% Число взаимно-простых числел
fi_N=(P-1)*(Q-1);
VPN_fiN=Euclid(fi_N);
% Открытая экспонента
e=VPN_fiN(randi(numel(VPN_fiN)))
% Закрытая экспонента
d=mod(Euclid(e,fi_N),fi_N)
% Переводим сообщение к двоичному виду
% dec2bin double
Mes=dec2bin(double(get(handles.edit3,'String')))
n=numel(Mes(1,:))
% Запишем результат в строку для удобства
Mes=reshape(Mes',1,numel(Mes));
% Рзмер блоков выбираем как максимальное значение для степени 2
k=floor(log2(N))
% Делим сообщение на блоки необходимого размера
if mod(numel(Mes),k)==0
    M=reshape(Mes,k,numel(Mes)/k)';
else
    for i=1:floor(numel(Mes)/k)+1
        try
            M(i,:)=Mes(1:k);
            Mes(1:k)='';
        catch
            M(i,:)=strcat(dec2bin(0,k-numel(Mes(1:end))),Mes(1:end));
        end
    end
end

% Приводим к десятичной форме
M=(bin2dec(M))';

sM=double(mod(sym(M).^e,sym(N)))

set(handles.edit5,'String',(num2str(sM)));

dM=double(mod(sym(sM).^d,sym(N)));

Mes=dec2bin(dM);

if mod(numel(Mes),n)~=0
    SIN=Mes(end,mod(numel(Mes),n)+1:end);
    Mes=reshape(Mes',1,numel(Mes));
Mes(end-k+1:end)='';
Mes=strcat(Mes,SIN);
Mes=reshape(Mes,n,numel(Mes)/n)';
else
        Mes=reshape(Mes',1,numel(Mes));
        Mes=reshape(Mes,n,numel(Mes)/n)';
end
% Запишем результат в строку для удобства


set(handles.edit6,'String',char(bin2dec(Mes)'));

set(handles.modul,'String',['Модуль:  ' num2str(N)]);
set(handles.fi,'String',['Функция Эйлера: ' num2str(fi_N)]);
set(handles.e,'String',['Откр. экспонента: ' num2str(e)]);
set(handles.d,'String',['Закр. экспонента: ' num2str(d)]);






function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
