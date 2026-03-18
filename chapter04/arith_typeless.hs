-- 項の型定義
data Term
  = TmTrue
  | TmFalse
  | TmIf Term Term Term
  | TmZero
  | TmSucc Term
  | TmPred Term
  | TmIsZero Term

-- 数値かを判定する関数
isnumericval :: Term -> Bool
isnumericval TmZero = True
isnumericval (TmSucc t1) = isnumericval t1
isnumericval _ = False

-- 真理値かを判定する関数
isbooleanval :: Term -> Bool
isbooleanval TmTrue = True
isbooleanval TmFalse = True
isbooleanval _ = False

-- 値かを判定する関数
isval :: Term -> Bool
isval t
  | isnumericval t = True
  | isbooleanval t = True
  | otherwise = False

-- 1ステップ評価
-- isnumericvalで条件分岐する辺りとか気持ち悪いし、行き詰まり状態があるせいで評価が失敗する場合を処理しないといけず、実装が面倒臭いが、それもこれも型無しのせい。きちんと型が付いてれば、型で分岐できるし、失敗しないのでモナドも不要になって、実装が楽になるはず。
eval1 :: Term -> Maybe Term
eval1 (TmIf TmTrue t2 t3) = Just t2 -- E-IFTRUE
eval1 (TmIf TmFalse t2 t3) = Just t3 -- E-IFFALSE
eval1 (TmIf t1 t2 t3) = TmIf <$> eval1 t1 <*> pure t2 <*> pure t3 -- E-IF
eval1 (TmSucc t1) = TmSucc <$> eval1 t1 -- E-SUCC
eval1 (TmPred TmZero) = Just TmZero -- E-PREDZERO
eval1 (TmPred (TmSucc nv1)) -- E-PREDSUCC
  | isnumericval nv1 = Just nv1
eval1 (TmPred t1) = TmPred <$> eval1 t1 -- E-PRED
eval1 (TmIsZero TmZero) = Just TmTrue -- E-ISZEROZERO
eval1 (TmIsZero (TmSucc nv1)) -- E-ISZEROSUCC
  | isnumericval nv1 = Just TmFalse
eval1 (TmIsZero t1) = TmIsZero <$> eval1 t1 -- E-ISZERO
eval1 _ = Nothing -- 正規形である場合

-- 1ステップ評価を繰り返し、正規形を返す
eval :: Term -> Term
eval t = maybe t eval (eval1 t)

-- 大ステップ評価(演習4.2.2.)
-- 1ステップ評価の繰り返しでは正規形が行き詰まり状態であれば行き詰まり状態まで評価をする。
-- しかし、大ステップ評価は値に評価される場合しか扱わないので、失敗することがある。
evalgiant :: Term -> Maybe Term
evalgiant v -- B-VALUE
  | isval v = Just v
evalgiant (TmIf t1 t2 t3) =
  case evalgiant t1 of
    Just TmTrue -> evalgiant t2 -- B-IFTRUE
    Just TmFalse -> evalgiant t3 -- B-IFFALSE
    _ -> Nothing
evalgiant (TmSucc t1) -- B-SUCC
  | maybe False isnumericval t1_result = TmSucc <$> t1_result
  where
    t1_result = evalgiant t1
evalgiant (TmPred t1) =
  case t1_result of
    Just TmZero -> Just TmZero -- B-PREDZERO
    Just (TmSucc nv1) ->
      -- B-PREDSUCC
      if maybe False isnumericval t1_result
        then Just nv1
        else Nothing
    _ -> Nothing
  where
    t1_result = evalgiant t1
evalgiant (TmIsZero t1) =
  case t1_result of
    Just TmZero -> Just TmTrue -- B-ISZEROZERO
    Just (TmSucc nv1) ->
      -- B-ISZEROSUCC
      if maybe False isnumericval t1_result
        then Just TmFalse
        else Nothing
    _ -> Nothing
  where
    t1_result = evalgiant t1
evalgiant _ = Nothing