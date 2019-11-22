@interface SBIconController : NSObject
-(BOOL)isNewsstandOpen;
-(BOOL)hasOpenFolder;
-(id)_currentFolderController;
@end

%hook SBIconController
-(void)handleHomeButtonTap {
	if(([self respondsToSelector:@selector(isNewsstandOpen)] && [self isNewsstandOpen]) || ([self respondsToSelector:@selector(hasOpenFolder)] && [self hasOpenFolder]) || ([self respondsToSelector:@selector(_currentFolderController)] && ![[self _currentFolderController] isKindOfClass:%c(SBRootFolderController)])) {
		%orig;
	}
	return;
}
%end