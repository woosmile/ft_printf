# ft_printf

- printf 함수의 구현

## 주요 학습 내용

- 가변 인자 (Variable Arguments)의 사용 방법을 알게 되었음.
- 가변 인자는 하나 이상의 고정된 인자가 반드시 필요하고 이 고정된 인자를 기준으로 주소값을 설정함
- 가변 인자 하나의 공간은 4byte를 차지하므로 va_arg 함수를 통해 다음 인자를 가리킬 때 최소 자료형이 int임
- 구조체의 사용 방법에 대하여 깊게 공부하게 되었음

## 함수 설명 (Mandatory Part)

### int	ft_printf(const char *s, ...)

- 문자열과 가변인자를 매개변수로 받고 출력할 문자의 개수를 반환값으로 함
- va_list ap : 가변인자의 포인터 변수 ap 선언
- va_start(ap, s) : 고정 인자의 주소를 기준으로 가변인자의 포인터 변수 초기화
- %가 오면 printf_distributor에서 c,s,p,i,u,d,x,X 경우에 대한 처리 진행
- 일반 문자면 그대로 출력

### int print_distributor(char c, va_list ap, int *len)

- c,s,p,i,u,d,x,X 에 대하여 처리를 진행하는 함수
- %%일 경우 % 문자 하나 출력
- 반환값으로 출력 실패 여부를 전달함 (1이면 성공, -1이면 에러)

### int	print_char(char c, int *len)

- char c 문자 출력 및 len 값 1증가

### int	print_str(char *s, int *len)

- s 문자열 길이 측정 후 출력, 길이 만큼 len 값 증가

### int	print_addr(void *addr, int *len)

- addr을 unsigned long long 임시 변수에 저장함
- NULL인 경우에는 0x0 출력
- 주소 값을 16으로 나누어서 출력 자리수 확인 (이때, 0x에 대한 2자리 고려)
- 16으로 나눈 나머지를 배열의 인덱스 값으로 하여 값 변환 (0123456789abcdef)

### int	print_nbr(int n, int *len)

- 숫자를 문자로 변환시키는 과정 진행
- 11칸 짜리 배열 선언하여 10으로 나눈 나머지에 + ‘0’을 하여 ascii 문자 숫자값 저장

### int	print_nbr_u(unsigned int n, int *len)

- 부호가 없으므로 10으로 배열 선언
- 나머지 과정은 printf_nbr과 동일함

### int	print_hex(unsigned int n, int *len, char c)

- 0x를 고려해야하는 것을 제외하고는 printf_addr과 동일함
- 단, x가 소문자, 대문자에 따라서 값이 달라지므로 hex에 해당하는 문자열을 소문자, 대문자 별로 2개 선언함

## 함수 설명 (Bonus Part)

### int nbr_length (C:50~52)

```
if (num >= 0 && c != 'u' && (options.blank || options.plus))
	r_len = r_len + 1 - (!num && options.prec_flag && (options.blank || options.plus));
```

- num이 0이면서 precision이 존재하고 blank, plus 플래그가 있다면  blank 또는 plus 기호 하나만 표시되어야 하므로 논리계산을 활용해 +1 - 1 = 0으로 조정함
- ex) printf(”%+.d”, 0) → +
