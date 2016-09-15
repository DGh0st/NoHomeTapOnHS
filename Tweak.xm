@interface SBIconController
-(BOOL)isNewsstandOpen;
-(BOOL)hasOpenFolder;
@end

%hook SBIconController
-(void)handleHomeButtonTap {
	if(([%c(self) respondsToSelector:@selector(isNewsstandOpen)] && [self isNewsstandOpen]) || [self hasOpenFolder]) {
		%orig;
	}
	return;
}
%end