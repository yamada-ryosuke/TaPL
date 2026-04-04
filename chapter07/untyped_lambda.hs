import System.Console.Terminfo (termColors)

-- 項の型定義
data Term
  = TmVar Int
  | TmAbs String Term
  | TmApp Term Term

-- 名前付け文脈の型定義
type Context = [String]

-- 項を表示する関数
showTerm :: Context -> Term -> String
showTerm context (TmVar x) = context !! x
showTerm context (TmAbs var_name term1) =
  "(lambda " ++ fresh_name ++ ". " ++ showTerm (fresh_name : context) term1 ++ ")"
  where
    fresh_name = pickFreshName context var_name
showTerm context (TmApp term1 term2) = "(" ++ showTerm context term1 ++ " " ++ showTerm context term2 ++ ")"

-- コンテクストの中で使われていない変数を作り出す関数
pickFreshName :: Context -> String -> String
pickFreshName context var_name
  | var_name `elem` context = pickFreshName context (var_name ++ "'")
  | otherwise = var_name

-- シフト
termShift :: Int -> Term -> Term
termShift = termShiftImpl 0

termShiftImpl :: Int -> Int -> Term -> Term
termShiftImpl censor diff (TmVar x)
  | x >= censor = TmVar (x + diff)
  | otherwise = TmVar x
termShiftImpl censor diff (TmAbs var_name term1) = TmAbs var_name (termShiftImpl (censor + 1) diff term1)
termShiftImpl censor diff (TmApp term1 term2) = TmApp (termShiftImpl censor diff term1) (termShiftImpl censor diff term2)

-- 項の変数var_iに項sを代入する
termSubst :: Int -> Term -> Term -> Term
termSubst var_i s (TmVar x)
  | var_i == x = s
  | otherwise = TmVar x
termSubst var_i s (TmAbs var_name term1) = termSubst (var_i + 1) (termShift 1 s) (TmAbs var_name term1)
termSubst var_i s (TmApp term1 term2) = TmApp (termSubst var_i s term1) (termSubst var_i s term2)

-- その項が値かを判定する関数
isVal :: Term -> Bool
isVal (TmAbs _ _) = True
isVal _ = False

-- 1ステップ評価を行う関数
eval1 :: Term -> Maybe Term
eval1 (TmApp (TmAbs var_name term12) term2)
  | isVal term2 = Just (termShift (-1) (termSubst 0 (termShift 1 term2) term12))
eval1 (TmApp value1 term2)
  | isVal value1 = TmApp value1 <$> eval1 term2
eval1 (TmApp term1 term2) = TmApp <$> eval1 term1 <*> pure term2
eval1 _ = Nothing

-- 多ステップ評価を行う関数
eval :: Term -> Term
eval term = maybe term eval (eval1 term)

-- 大ステップ評価(演習 7.3.1.)
-- 項が変数だった場合は失敗する
evalGiant :: Term -> Maybe Term
evalGiant term@(TmAbs _ _) = Just term
evalGiant (TmApp term1 term2) =
  case (evalGiant term1, evalGiant term2) of
    (Just (TmAbs var_name t12), Just v2) | isVal v2 -> evalGiant (termShift (-1) (termSubst 0 (termShift 1 v2) t12))
    _ -> Nothing
evalGiant _ = Nothing