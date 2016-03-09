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
Mes=dec2bin(double(get(handles.edit3,'String')));
% Запишем результат в строку для удобства
Mes=reshape(Mes',1,numel(Mes))
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
M
% Приводим к десятичной форме
M=(bin2dec(M))'

sM=mod(M.^e,N)

dM=mod(sM.^d,N)

% dec2bin(dM)

function edit3_Callback(hObject, eventdata, handles)

function edit3_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
